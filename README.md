# Spring Boot Practice 🧩

Spring Boot를 적응하기 위한 토이 프로젝트 입니다.

---

## 🧱 ERD

![image](https://github.com/user-attachments/assets/bb67513e-b2e1-4e00-a93a-7e66a70537c7)

---

## 📦 주요 기능

### 📌 회원가입
  - 아이디 및 이메일 중복확인 체크 기능

### 📌 로그인
  - Spring Security를 적용한 로그인 기능
  - JWT 토큰 사용 x 

### 📌 TodoList
  - TodoList 추가, 삭제, 업데이트 기능
---

## 🏗 Spring의 이해
🌱 1. Spring Framework

   - Spring의 핵심 기반이 되는 프레임워크로, 객체의 생성과 의존성 주입(Dependency Injection), AOP, 빈 생명주기 관리 등의 기능을 제공합니다.
   - @Component, @Bean, @Autowired 같은 어노테이션을 통해 객체를 관리하고 주입받는 구조를 쉽게 구현할 수 있게 해줍니다.
   - 핵심 목적은 객체 간의 느슨한 결합(Loosely Coupled) 구조를 만드는 것입니다.


🌐 2. Spring MVC

   - MVC(Model-View-Controller) 패턴을 기반으로, 웹 요청을 @Controller로 받고, @Service, @Repository 구조를 통해 계층을 명확히 나눌 수 있습니다.
   - 사실상 @Controller, @Service, @Repository는 모두 @Component를 확장한 것이라, 스프링이 자동으로 Bean으로 등록할 수 있게 도와주는 역할을 합니다.
   - 즉, Spring Framework의 컴포넌트 기능을 웹 구조에 맞게 확장한 것이 Spring MVC입니다.

   
🚀 3. Spring Boot

   - Spring Boot는 **Spring Framework와 Spring MVC를 쉽게 사용하게 해주는 도구(툴킷)**입니다.
   - XML 설정 없이 application.properties 또는 application.yml로 간단하게 설정 가능하며,
   - 톰캣(Tomcat) 같은 웹 서버를 내장하고 있어서 따로 설치 없이 바로 실행 가능합니다. 
   - 대표적인 장점은:
     - 빠른 애플리케이션 시작 (main() 실행만으로 가능)
     - 의존성 자동 설정 (spring-boot-starter-*)
     - 운영환경에 적합한 설정 자동 제공 (예: 배포 시 최적화 설정)
---

## 📝 느낀점

기존에 Spring Boot 없이 Spring Framework 만으로 앱을 제작할 때는 수많은 설정을 해야 했습니다.  
예를 들어,

- Rest API 빌드를 위한 준비: Spring MVC, Tomcat, JSON 변환기 설정  
- Unit Test: Spring Test, JUnit, Mockito…  
- 의존성 관리, `web.xml` 설정, 스프링 빈 등록용 `context.xml` 구성 등  
- 위 과정을 매번 반복해야 했습니다.

Spring Boot의 목적은 **개발자가 더 빠르고 편하게 앱을 만들도록 돕는 것**이라는 점을 직접 느꼈습니다.

예전에는 Servlet 기반 앱을 만들 때:

- Tomcat을 따로 설치해야 했고  
- `.war` 파일을 빌드해서 `webapps` 폴더에 복사해야 배포/테스트가 가능했지만,

Spring Boot는 내장 톰캣 덕분에 `.jar` 파일만으로 실행, 테스트, 배포까지 모두 가능했습니다.  
→ 이 점에서 **Spring Boot의 핵심 가치**를 직접 체감할 수 있었습니다.

또한 Spring Boot를 처음 접했을 때는  
**"Spring Context를 실행하는 주체는 누구일까?"** 라는 의문이 있었지만,  

`@SpringBootApplication` 어노테이션이  
- 스프링 컨텍스트를 실행하고,  
- 컴포넌트 스캔을 시작하며,  
- 자동 설정까지 활성화하는  

**Spring Boot의 핵심 진입점**이라는 것을 학습했습니다.
