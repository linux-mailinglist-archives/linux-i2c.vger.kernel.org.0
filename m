Return-Path: <linux-i2c+bounces-8609-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 063FD9F70DA
	for <lists+linux-i2c@lfdr.de>; Thu, 19 Dec 2024 00:37:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B9EFA188EFD8
	for <lists+linux-i2c@lfdr.de>; Wed, 18 Dec 2024 23:37:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B125B1FCFE2;
	Wed, 18 Dec 2024 23:37:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I6exCkbO"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B770A1A3A8A;
	Wed, 18 Dec 2024 23:37:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734565039; cv=none; b=Z98BC6WnFGPIlk5FjS5ns2pVt9eVmpHyNxkK2f2z498RvzydbARNmAIvXvk3ifVfwJbzUi5Q5wYohfR9XCdX3o4k7oS6p7qJI14qt9j+n1bdCBCcMkaLk6LuIsuDMhdB3xgEsR8j/HSzysT5D4d0bEvg8PoBOShniupWq39BqCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734565039; c=relaxed/simple;
	bh=BBqoGHlkR17tgAKAUcW3ZqdO5VaegekKJmsJSGGsIk4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=hrmRaYE986VVnjLlRoYI3Pq0xJrK0hCo9AheqT8TKjc9DNNkTaGV/5/1rkTqAqu0/5sby3/ZYruW3cHV8qv2leL5HbSvx/24AVhH1c1Yy2X5p69bs/qP3ULkGhOt2ZmkUPEIsfGQV7SFLYv2GslwwU2+wleHBmwsEfsR9SpNdVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I6exCkbO; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2156e078563so1889245ad.2;
        Wed, 18 Dec 2024 15:37:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734565037; x=1735169837; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Wic9LF6DatIGEX+AB8E/YwXEtQxkBeWoBqH09Vgvp/o=;
        b=I6exCkbOhFRGLTTMlmSWqWTWjivRtllTrTCrJtbm1mliR+b/3q8PGp9wys0pcoYHah
         NHWscAUMnva89xdgR3th8BzV5ayWZGyYaRmfWEdsbXhfpUrEzo7JfHDdWztdGajolyry
         wm8jqGMJxWZLVyCA3qdPgtRRMQjlUGEyyDgVkGIZIoRL5/uqe01CTt6b65EJt9jud2zh
         yjFxJYZkojnODKDcEcG2xApYOP3/HEfOQDJor+G27m2dII2wMBCXZORnI+GgDOu8SaJ2
         Au+u4ciItSltW2sZlZKcDik0e3WxJvmaGBZJ2Zh+gv1VL2IuqtjAetCSjIlmG2HYpclO
         BO+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734565037; x=1735169837;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Wic9LF6DatIGEX+AB8E/YwXEtQxkBeWoBqH09Vgvp/o=;
        b=ssdgroqJn5d78OALvGGMdQMe8ni0C7PkWSynbUhXwV0Y7UcKC6LpJRhSYKKgQTDJfP
         HsQwODPHR0I6pukqqbWdgML4hGIyq2nPqOU7QL7HCIWbTL+Csy+n90crrw1Jh96TDzCh
         G/2JWkQ2fRVvtdxHBiSeTuqKrou/ZPYFK17YrkUc89KcJM021UckoRfuRzbUKQ52Ho0m
         2LU5XeqxRwSMEa7pBTJuZ7vM3LaDz+di5oxR4MF0vsYz0srDyDUdmLpAlatELflvCFdy
         fZbP2Z1agTkPbbIUZdhVIQguIODSO5vgT+J31w4sdUMIXW8H7hZR6+pjQ2posUOxPYOC
         5klg==
X-Forwarded-Encrypted: i=1; AJvYcCUZjdxFBqiUgMZCjzet/LNzgZ7PoW1gQdTjxAuatomfDck7iB5UUIAlhkl6D2HOBvDSMeldkdW2F7P0@vger.kernel.org, AJvYcCUgpaUpiKgIprJIVFwWY6H7e+JeboBtVe8JhMPNVXVEPfK4IcG5jZy6MK9Dmc5j9L1WaWD9bQlGuLMCbLGExHI=@vger.kernel.org, AJvYcCWlOo6hg7x3Sdw1RV79GczcKZhALKNceoeDulSJb3WlwSL414Bacx87/1zBsIDE4PWLTZ8nb60+XOktPqNr@vger.kernel.org, AJvYcCXFhpo22WDwmmBrPHZDv+OdN7i+NtLex5O4iU6D/fl0BADtTliEPdoKkukK8aoNAzLWpcsiJXW7PN9Jf6yt@vger.kernel.org
X-Gm-Message-State: AOJu0YxqckbPgXnGDQWBjkF7G+VwRncb8pzk6/D2j51usiL7P3k05OJ9
	8b6PmZJXBumXi1HvWxH5LYhM9KAV5LOOlHv5bU4eNyU1GlgqymChRUidrBCGUzM=
X-Gm-Gg: ASbGncsnF5uP4GldPYtwrvzCQ8xNV7IeWr0JsstCij1CX2iLrbCPNBU9gb+lR1mYRN7
	4xvUAZqM3crunreUJvAolAHfEoDb9zUJVUxlvm+Wu1sZBtmj7vfWir2NPZyOy+Ges4GZe/ZcMWq
	m0FN6yL2mhkvHeZcooQGsaHmluNL+ztVFMhQGXcKcHpub0TvRaHrnFTTExVjUFOptpX28KCqfkS
	+bZ8fD2Iva6iFrBAFuRq8+WXGSHVuV88Zil1znaVHVv7nduK01aw8lw
X-Google-Smtp-Source: AGHT+IFFbf2+GBv5rl4d4aESL+WpbxLGIg0xbMGMACyXMHCdepCl6vDinPllAc/IML8rql8jgojZig==
X-Received: by 2002:a17:903:24e:b0:216:48f4:4f1a with SMTP id d9443c01a7336-218d7215c62mr64802125ad.16.1734565036894;
        Wed, 18 Dec 2024 15:37:16 -0800 (PST)
Received: from [127.0.1.1] ([2001:569:fcea:600:2e06:283e:5daa:4d0f])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dc9f6967sm802335ad.214.2024.12.18.15.37.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Dec 2024 15:37:15 -0800 (PST)
From: Fabien Parent <parent.f@gmail.com>
Subject: [PATCH 0/9] Regulator driver with I2C/Regmap Rust abstractions
Date: Wed, 18 Dec 2024 15:36:30 -0800
Message-Id: <20241218-ncv6336-v1-0-b8d973747f7a@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAH9cY2cC/1WOwWrDMBBEf8XoXIG0WslSCCX/UXJYSytbtHEd2
 wmBkH+vUE49vmHmMU+x8Vp4E4fuKVa+l638zhX0RyfiRPPIsqTKAhSgVmDlHO/OGCc1GEAKGF0
 woraXlXN5NNPX+c0rX29VuL9DceFtoyY8dMfmA22tkgv9LGWnnSU/ptuFpUEfT+PK4/f02dS0x
 6nNXPDWD+SBB+stEHLPxiXlMUHQ/VADTy6m/yuT9VAvB50spR4hOx8oqIR6yMn0gJgzamPE+fX
 6A9gc1M4RAQAA
X-Change-ID: 20241025-ncv6336-12324a94c693
To: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>, 
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <benno.lossin@proton.me>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Wolfram Sang <wsa+renesas@sang-engineering.com>, 
 Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Fabien Parent <parent.f@gmail.com>
Cc: devicetree@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, vinod.koul@linaro.org, 
 Fabien Parent <fabien.parent@linaro.org>, Fiona Behrens <me@kloenk.dev>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5445; i=parent.f@gmail.com;
 h=from:subject:message-id; bh=BBqoGHlkR17tgAKAUcW3ZqdO5VaegekKJmsJSGGsIk4=;
 b=LS0tLS1CRUdJTiBQR1AgTUVTU0FHRS0tLS0tCgpvd0o0bkFGdEFwTDlrQTBEQUFvQmlKc2d4Q
 kw5cktRQnl5WmlBR2RqWEtHU1IyV3RxLy9zTVRDL0VtbjR2QnUwCi8zMDFhVUdNS1NrNjIxZ3Jh
 U2ZtYUlrQ013UUFBUW9BSFJZaEJONk0wZElMeXpzd3JmRnNxWWliSU1RUy9heWsKQlFKblkxeWh
 BQW9KRUlpYklNUVMvYXlraHlVUC8xUWxGd29udGtBTlFNdVgzYVdzWDFlNFk3TGZGWVNsdFY4aw
 pXVkJQSGRxK25MWGpYRVN6S3VHViswNm5hYlF4MGJZbUY4VWxMWXZrL3BCcTBpWUFBK1RRQTlaS
 UtTb1RvUWdtCkNoR1RoNXBsRjBwSU1tME5TdFl3NndNVzBiOGhBS1VPYkNFWm90ajRidU9UZU5t
 L092ZzMyUExqeTRTUnN5RzIKTmc3aG1kUEhXMlIwcXJ3bVdGNlNqMXoxcVQ4Vm5BYTl1Q3EyS2Y
 0R0EvVXR2UTYvY1VVelM4aStoMWVSMUhlWAphZ0lkL1dQVFg2c1pVNGVHOFBDNTNERW1JUmZTV0
 5mN0NLZGhyREc2MDRHTUZ4WGFvZVRiTFkzckpiY2hiZ1lKClI0UUZEd0FwMXZaditVL1N0WU5VM
 UczUUpHRVc1N21qZ3BMYVJGQ1NqT2xRMUNnaS9TQ2laQlAzNzFQd2JpUm0KeEFMNnZGb0w5OUpQ
 UWsyNnpKNEhyRUJrUEtSdlU5bWZOaHQxNzlZNDJDV3FrNHR2Ylp1SXhlOUViSk5DZnN2TgppUFN
 OSWowa1ZQS3ZyallNTzBCcjhhSVQydE42cU44K3pLcTRuWjJNdzJqMXQ0by9NMHRQUGxHNW9wMW
 FHVWVaCmJaaXEzZTBIb200ODhaNnozdEZwV05Hb1J2eE1YNlkwNFo4cnhXQS9PdGRuWDFEY3N0b
 3cwUFlWTmRJS3VaeGwKSUdjL1JUUzdWeUZPWFp4MnEzNmtVb0NtYVNsSFA4YnRybGJFNVYwUFRq
 T0NhYTNPanF3aFhBRjVqNXdOVnBkOApGblhOWnVxZmdBVmQ2KzNZVG9KUlFGaHhsRGo3eUU5bVc
 4YkhCazV6UUh4U2NERHBGbFRkRHd0TWQ0SXVLTEZMCjNLVUFwejJ0MWl3a05RPT0KPVZmR1gKLS
 0tLS1FTkQgUEdQIE1FU1NBR0UtLS0tLQo=
X-Developer-Key: i=parent.f@gmail.com; a=openpgp;
 fpr=07BB034F9E8E3AF0DF4CF7607AE864A1E16FA383

This patch series adds a new regulator driver used by APQ8039 T2,
as well as all the Rust abstractions needed to write that driver.

This series is adding three abstractions:
* I2C: I do not expect this one to be too controversial since it is
  closely following what is done for the platform abstraction.
* Regmap: This might be the abstraction that will trigger most of the
  conversations since I took some liberties, and used what Rust has to
  offer in order provide something that seems to me user-friendly while
  also providing type-safety to ensure correct usage of the APIs.
  
  A problem I faced is that 'struct regmap' is not reference counted,
  and pointer to it are being held in several places. In C it is
  mostly expected to use devm_ API during allocation and forget about
  the pointer lifetime, but this does not seem idiomatic to rust since
  one would expect that the `Regmap` structure to be deinited and
  deallocated when dropped. I was hesitating between adding a refcount
  to the C API, or maintain some form of refcount by wrapping the
  structure into a Arc, and making sure that each abstraction for C code
  that hold a pointer to a regmap would keep a Arc<Regmap> instance.
  I chose to do the later for simplicity.
* Regulator driver: This one contains the bare minimum to write the
  ncv6336 drivers. I also have an abstraction for the consumer part, but
  it will come later in another patch series for another driver.

Dependencies:
[1] Entire series depends on the patch series from Danilo adding Device
and OF Rust abstractions: 2024121550-palpitate-exhume-348c@gregkh
[2] "rust: add abstraction for regmap" depends on genmask:
CAH5fLgjOKQdKViAGArMjvXjVmYpbo_sA8xoQGwu+DCW1FDFRXA@mail.gmail.com
[3] "rust: regulator: add support for regmap" depends on the Sealed trait:
20230224-rust-iopt-rtkit-v1-1-49ced3391295@asahilina.net

A while ago when Rust support was close to getting merged in the kernel
I decided to learn Rust to see what the fuss was about and see if I
could help contribute to it. Since then I've been working on a few drivers
during my free time, but my code was depending on too much out-of-tree
code. With the patch series [1] getting close to being merged, it was
finally time to send my code to the mailing list, so here it is.

Happy reviewing!

Fabien

Signed-off-by: Fabien Parent <fabien.parent@linaro.org>
---
Fabien Parent (8):
      rust: add abstraction for regmap
      rust: error: add declaration for ENOTRECOVERABLE error
      rust: regulator: add abstraction for Regulator's modes
      rust: regulator: add Regulator Driver abstraction
      rust: regulator: add support for regmap
      dt-bindings: regulator: add binding for ncv6336 regulator
      regulator: add driver for ncv6336 regulator
      arm64: dts: qcom: apq8039-t2: add node for ncv6336 regulator

Fiona Behrens (1):
      rust: i2c: add basic I2C client abstraction

 .../bindings/regulator/onnn,ncv6336.yaml           |   54 +
 MAINTAINERS                                        |    4 +
 arch/arm64/boot/dts/qcom/apq8039-t2.dts            |   23 +
 drivers/regulator/Kconfig                          |    7 +
 drivers/regulator/Makefile                         |    1 +
 drivers/regulator/ncv6336_regulator.rs             |  241 +++++
 rust/bindings/bindings_helper.h                    |    4 +
 rust/helpers/helpers.c                             |    2 +
 rust/helpers/i2c.c                                 |   13 +
 rust/helpers/regmap.c                              |   48 +
 rust/kernel/error.rs                               |    1 +
 rust/kernel/i2c.rs                                 |  288 ++++++
 rust/kernel/lib.rs                                 |    6 +
 rust/kernel/regmap.rs                              | 1043 ++++++++++++++++++++
 rust/kernel/regulator.rs                           |   44 +
 rust/kernel/regulator/driver.rs                    |  991 +++++++++++++++++++
 16 files changed, 2770 insertions(+)
---
base-commit: 26033691d5821bb493dd3426140939d0a79cd480
change-id: 20241025-ncv6336-12324a94c693
prerequisite-message-id: <2024121550-palpitate-exhume-348c@gregkh>
prerequisite-patch-id: b798fb7308e85f8cd237e3de0c33f3079eec29b8
prerequisite-patch-id: ac93ef5057cbb09cf886223c4f10e53eeec1d234
prerequisite-patch-id: ea80287941ef43f59fa75a28e6798ff10c8e90c1
prerequisite-patch-id: 482d8f7c10b0b79fb5d06e3718fd6da0fdd0dfa2
prerequisite-patch-id: cd9756c9586f394e5b39198497979aa1384ad2b8
prerequisite-patch-id: 313083700e67eab809a6b673d1fd835a6bd18625
prerequisite-patch-id: d0c7198d84ffa229221bbe06541136c97e8aae4e
prerequisite-patch-id: 0c4e157879b92f366feca2e89b5719e0a9bfa36a
prerequisite-patch-id: 515464a50ad216e2e9811043db8ca341262db288
prerequisite-patch-id: c50da45a4d7e62930f78b854f9afc636120dc255
prerequisite-patch-id: 5e32316afbfed41fe68cc096bf5a93201d0c65f9
prerequisite-patch-id: 15b08041af5e8f50619e3098b01ac0c0c0357751
prerequisite-patch-id: 3feaab560cf92641ee1af4e07cd5cb2a50aa36a5
prerequisite-patch-id: 14a272276db1704d58a2afc140da51826347a90e
prerequisite-patch-id: c79292d0686dd843cf25f5a2300445e410e99d13
prerequisite-patch-id: ea5c28331c595ad00929291b483c8848f3ff84cf
prerequisite-patch-id: 69858ba82eb5852a4e7e36d084d2917ba4e8a6cd
prerequisite-patch-id: 3f1b33691d5ad742f689a90d41bfd37244ff4133

Best regards,
-- 
Fabien Parent <parent.f@gmail.com>


