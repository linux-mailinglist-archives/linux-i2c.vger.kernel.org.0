Return-Path: <linux-i2c+bounces-9368-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BE9EA31ACD
	for <lists+linux-i2c@lfdr.de>; Wed, 12 Feb 2025 01:49:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B19CE167F83
	for <lists+linux-i2c@lfdr.de>; Wed, 12 Feb 2025 00:49:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32D5381728;
	Wed, 12 Feb 2025 00:49:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nN3gp/hw"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com [209.85.222.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60AC118651;
	Wed, 12 Feb 2025 00:49:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739321348; cv=none; b=YTHIAHdSegApzrPRoUCGdhoPdcbWU2yQnwO10/jwpzZEz9ygLkcmOlcu00aC+ZMXOabji8g5WJ2K9Y3TdZ0uk91WpAJaUKggBg/BkPlqk1y/vAtyPxvWKI4ZNK/cA0kCoj0Px1DxxtwR7O538najXWVVdWVdzFwejOx8xLOkcvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739321348; c=relaxed/simple;
	bh=iuw2A8zkREkkUroCFRebmybVrMXnX7V3DMSxfmqIpNM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=rovlsHrx+lS/+0/oYEhfUTH2syVcpRSq9vpm3aIb1qXLihFBW9+HvibBZ66LH3orxom77DMMfp8wU3EXubmXjFRPMuU1blrx4hbBjpu3pp1mWrDNpVdetv6NC9HyojbtGMyismgEqX2zMK/qw1Fqx7JCIw43+2qn0UBe44YJlDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nN3gp/hw; arc=none smtp.client-ip=209.85.222.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-85c4c9349b3so1620083241.3;
        Tue, 11 Feb 2025 16:49:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739321346; x=1739926146; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cZLd1/1IT1KQrLTeqsilryM+oTbbpX7k277woXo0CNs=;
        b=nN3gp/hwEXGkP4coWkK8lnjnmhGAyj1+BE3CnXL6i0hYxucMJhxbPiwb7eI4GQVES/
         CLhob0zY471nVeBmJ6N8HGxtGDUWzncjKN1gXpM1vrS8m7Evs1KOnlxd/evOANXLpw+2
         X1gskgfWDo3jYkGgM7rsIukTR449blrN+MM6OVhAw5y5V4UMJurMLKMjY+bY8jz+3yt4
         tGYQLyIeLY8FuE9x1V/9nCJ6QSxHDV0hhotWDa2HTRy/rex+9cVXoy+7RTz2iRD3KTDv
         Z7isfOgcTJNSc+/sZ4LpRaOc8Ym7wPGr5+bIKeAUVQZxN0+yWglaJyk0lV6a9Ct+c+Zi
         esyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739321346; x=1739926146;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cZLd1/1IT1KQrLTeqsilryM+oTbbpX7k277woXo0CNs=;
        b=MRq/lhUM3qQRWMVSFaa8Bw6rqz3Be9Xt+tC9/AEefpUP2JRJaSEuJpW3jJlGYA9Qf+
         SXyrn4uVp7YgOszYuFErtGEoU57HoOA544UozuB6U3Hxd5WenPkShlqHYZr9ouaguZ1t
         hmxW1gtaOXcr9F0/t6wFUkocSWiPuZ2NYzJad57pW66YWZRDpZi9WMco4M/c0eoHpGqi
         J7QLz2Q/GXWA9j+lKMOwRWC4StCgsCYMdFNagUggJEYTEIw2lY0pKUsWzabSPoWXxVka
         SQiG1pPKZjBu5EBujqLEzCQTMVCsvcu8ZoiS9RAznVAyirvPAQ33CntY3RXBoVq2FARp
         DeMA==
X-Forwarded-Encrypted: i=1; AJvYcCU8yuESptq2ha6D8EJwXJQM3K4xE8/Z4BDXU2HtWtcwlUCee/LJf0z8YBjPFQfs4G3CZIQo8l6ZAE60@vger.kernel.org, AJvYcCUjZy+u6ef5Vu13J5u4u8XMsTPkZQSxzMlgem8QdH2PlpwItJx6QzV8PhbybkwCGRNWN0AyHIGkwDPe@vger.kernel.org, AJvYcCVnrN9JYsTs2EqwA8hFtNC+mar/UqjEA6k9dIJNMnuOS8oYgPB3FTHA1eKO5NteTP71rUg05YUY9q7B@vger.kernel.org, AJvYcCX8zdGn95YvlEQfqzydbv67ztDXyHG0x0k1GyHsR03Qu15cjpR2kJkXZIsXD6Yk7bgw0xg79qDbfKzHdHGP@vger.kernel.org, AJvYcCXChBCdi7A0zMCgTHpsBu0cT29+B3039ndmpmAy3wCSIRX7/lcg7AKN/LWI21ItMewVgAjUiWIf8Gs75aPinn/lsas=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9k1mA75GU8Jkou7lJ7cAPCPnx/wXxSoJXY4QLWRa1CSXkK79U
	XKCyPHYIAzI+CqlZaJyPyFFWnNKpZuQnrbvzHlFIlVt8Qdt/6GYv
X-Gm-Gg: ASbGncsOGNk8Xsck8iOMS8lBHcmwDaPXw45a2S6/B5MtzZ438wczLWwPF3Gcv9u12Gi
	hBZyVZzjsWve3t1Y/ErVKLqZn9L/n+dJo1nu0eFYLKm9qV29JKVAcQIhAkcXklhvbfDRBa/I5oX
	Bbs9YcLEfGRQ6uuCFAffE/XhwgD4i3IJgQJQhAn5kcIMSnke9bPbn3HWkvaHDxrK6OwtZXbDQ9D
	kI/3Dhdm5IqlY3auyIjF080vuXSZaNCGNL95VZibRHHBv5CTT6y0ZZnDKY6yy0/GVNn+KbbHn3M
	ZWuU8X5Sxm15sxwmGEzXS1j8p72eBo22UNdFRPt94ZIeY34H5mU5b9MQIm6cAkyCfXqL4d5CToY
	EoQ==
X-Google-Smtp-Source: AGHT+IEkusJS08i56e3/A5ApNn7f580UIg227FWVQE1R58c4fK8LR1PjSKqLhKoph0+OeBxjbqNdCQ==
X-Received: by 2002:a05:6102:50a9:b0:4b2:48ba:9943 with SMTP id ada2fe7eead31-4bbf231076fmr1647416137.24.1739321346111;
        Tue, 11 Feb 2025 16:49:06 -0800 (PST)
Received: from localhost.localdomain ([38.44.237.182])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4bbce4c6fcfsm823832137.23.2025.02.11.16.49.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 16:49:05 -0800 (PST)
From: Denzeel Oliva <wachiturroxd150@gmail.com>
To: krzk@kernel.org,
	s.nawrocki@samsung.com,
	cw00.choi@samsung.com,
	alim.akhtar@samsung.com,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	conor+dt@kernel.org,
	andi.shyti@kernel.org,
	igor.belwon@mentallysanemainliners.org,
	linux-samsung-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-i2c@vger.kernel.org
Cc: Denzeel Oliva <wachiturroxd150@gmail.com>
Subject: [PATCH v2 4/4] arm64: dts: exyno990: enable cmu-peric0/1 clock controller
Date: Wed, 12 Feb 2025 00:48:24 +0000
Message-Id: <20250212004824.1011-5-wachiturroxd150@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250212004824.1011-1-wachiturroxd150@gmail.com>
References: <20250212004824.1011-1-wachiturroxd150@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enable the cmu-peric0/1 clock controller. It feeds USI and I2C.

Signed-off-by: Denzeel Oliva <wachiturroxd150@gmail.com>
---
 arch/arm64/boot/dts/exynos/exynos990.dtsi | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynos990.dtsi b/arch/arm64/boot/dts/exynos/exynos990.dtsi
index dd7f99f51..843587b17 100644
--- a/arch/arm64/boot/dts/exynos/exynos990.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos990.dtsi
@@ -231,12 +231,34 @@ pinctrl_peric0: pinctrl@10430000 {
 			interrupts = <GIC_SPI 392 IRQ_TYPE_LEVEL_HIGH>;
 		};
 
+		cmu_peric0: clock-controller@10400000 {
+			compatible = "samsung,exynos990-cmu-peric0";
+			reg = <0x10400000 0x8000>;
+			#clock-cells = <1>;
+
+			clocks = <&oscclk>,
+				 <&cmu_top CLK_DOUT_CMU_PERIC0_BUS>,
+				 <&cmu_top CLK_DOUT_CMU_PERIC0_IP>;
+			clock-names = "oscclk", "bus", "ip";
+		};
+
 		pinctrl_peric1: pinctrl@10730000 {
 			compatible = "samsung,exynos990-pinctrl";
 			reg = <0x10730000 0x1000>;
 			interrupts = <GIC_SPI 417 IRQ_TYPE_LEVEL_HIGH>;
 		};
 
+		cmu_peric1: clock-controller@10700000 {
+			compatible = "samsung,exynos990-cmu-peric1";
+			reg = <0x10700000 0x8000>;
+			#clock-cells = <1>;
+
+			clocks = <&oscclk>,
+				 <&cmu_top CLK_DOUT_CMU_PERIC1_BUS>,
+				 <&cmu_top CLK_DOUT_CMU_PERIC1_IP>;
+			clock-names = "oscclk", "bus", "ip";
+		};
+
 		cmu_hsi0: clock-controller@10a00000 {
 			compatible = "samsung,exynos990-cmu-hsi0";
 			reg = <0x10a00000 0x8000>;
-- 
2.48.1


