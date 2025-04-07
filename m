Return-Path: <linux-i2c+bounces-10106-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 944F4A7D172
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Apr 2025 03:08:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 100943AD0AB
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Apr 2025 01:07:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5067D15A864;
	Mon,  7 Apr 2025 01:07:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A0lvbUHx"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 885B46F53E;
	Mon,  7 Apr 2025 01:07:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743988024; cv=none; b=luwEC+aOXyl+K28p3RaMeeWzDzTtOOIlhg8UNIQXRR3dc4jS4nr88JS7bkeOkNrV08RCtth2iL9pzz7lysk1e6qlIKxcchQnSBm+sJd3hNKn9zp96rvUbmBzuCFuvGVeNgWsob/qWgqJaXSdBDtANtNLV0PO4fDYOOwrKz8drrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743988024; c=relaxed/simple;
	bh=zCo+Qwlnj+LFgJZXj+07HKs/ViAYB0ypXv4DMwLQ9CY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IUUsaSygH7+A/LTXDG5yxUPp7Pxu5wg9Ch5WVt47/FRRx/ZsAIdoNRMX1u3pKfEonV/hOrzAxcAE9RQCE0GPI2wgvO+9kvfaQKU4KXv05BuIz2EgeMUFyE6BOf8BS7SRZq/UDtrQbuCocTJK3FScdNjt7MeUbV4poSU/WhsTLH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A0lvbUHx; arc=none smtp.client-ip=209.85.222.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-7c55500d08cso362862085a.0;
        Sun, 06 Apr 2025 18:07:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743988021; x=1744592821; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=siqPQU+FyAku8vhhn3ZUC1oR8uSZvTqCHGJlE8+8NrQ=;
        b=A0lvbUHxAeTAqApAD+4UObN68f4lK2LCQUVQPf65e2JrqZab7mE15xez1LTSOPuqnY
         GSURETAcpOG3KGUru81UOaVpx8Oq5Qew13Bps7obx6X/wuqSv2igaIyl3LvdnJqbED3r
         LT/jrbmF0lirooLAXnAJfuBg5Fj0DiTY1c3DTQUQkmY7+/ncup9n8Pb9o76gOgGlo31w
         QT8ffwbEh/E1JfPlHaMA9YaTYL5yapVRCGO1GN6R2kUBYa2v41GyENWomgfBZP2KPPVv
         DOUtY2fKfJepUeKmmQ4gvZTRBnbed3b4C74YvxixWst5m//TFaKOd61i2NDju8wKPLX2
         8N2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743988021; x=1744592821;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=siqPQU+FyAku8vhhn3ZUC1oR8uSZvTqCHGJlE8+8NrQ=;
        b=Jklj/Bx+4cTJ9UGfk1tZ6SNfHI6h5q+0FdZ3wXOkNXnS5ZSFFhueQxFZokE/pCy9QZ
         dpCUEj6wm1gx7TZptRXHar5vPfFwoXtTdOi/QFE6c7QT6PmqQuL+FpEJ+cnTa5Hamk6l
         sBh/B5+YclgWGopxtdSra0wPE79oKTuIvHuRHuOiaUAXXFlJI5uLNSB6N59yLYcpugbD
         OZyEl8XtE17iJSmSHfPij/tjMzywf0XDN6c6O7xtSUZvDPrmijWWm1+TID90RIucK9n4
         Q9aAAUxyg+i4gBWXpR1OBjOP/tClAecgvuWbKEzNvsW7aFkhQFEvzmCJYRaaRD8Ogyf5
         IjzQ==
X-Forwarded-Encrypted: i=1; AJvYcCU9U5PwNX/EA2i9IgDimtwjAikVdcpDTlz6IOglJZtNLkwCJJ4Bc+UFqLqgjU23ZhbdFH7wTaBmlTrW@vger.kernel.org, AJvYcCUvIvaDIAp+en7ObbcTRf3ZEhge4d1ClcAddp9psi09wZ4qfODQ4cygdvtPIDDUCsyrQUP15wFUguTpgn4T@vger.kernel.org, AJvYcCV1lJaaix04XVZgMbvhsXVhs3Mi3TcmElUQnd/nJbCy0O+vBDK7zu9d3rlUP+HhiHtd0bRuPnL/Onhj@vger.kernel.org, AJvYcCVg8bT7S75uDR8R4DzHm5zjqkjsVNv2Old6tYop4m7puDUlstgR96UZJmCfYgHyztlnWJ0lEL4BDxnh@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4AUIhcvVI8+ZRdMYLIHJGVeDq+PV1E59fV2eUcFjnc3A4AH3m
	XYSVjGjm0H0nU784D3ySqgSgPgxF9sQyYfvkpjbN5q5KV1q0+koJ
X-Gm-Gg: ASbGncupqoIh1lhkAq+5DbOcsZOzrFDDbSdqcQH7aDQNpYiIU1Rcl8E7GoUnyYNwSmy
	fJT8tAYMfdtIDkbf+zvz24VxZytBbg+C2GhJHEKIulCmkXMGkCnpRkHz36RIA5TByQxnb3w6XOK
	E8EWjKFPmIAGKN6bixgMCYSAoy7Mom/1HzL8tjGQua+sj+RHhBT55dNSo3HVxlloNMPCiZBTW7y
	8fKEa/psUXuBVyGdUbMq6p+MYS+yKjZKRpf6ZK+zY0dqZHh8nF5KWbwZ0HjMikuOyED+43/MGck
	pDQ0J8Jzu4+YmFga/8eb
X-Google-Smtp-Source: AGHT+IHOF406ZAY4FtFhD2l8xlyDvh5PHaA+xtI7orTdCQHDTm8ZGVImUr8k5ecrmbJiiqwwrdv5HQ==
X-Received: by 2002:a05:620a:280a:b0:7c5:a5cc:bcb9 with SMTP id af79cd13be357-7c77dddd878mr1080915485a.56.1743988021428;
        Sun, 06 Apr 2025 18:07:01 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-7c76e96cf01sm528160285a.55.2025.04.06.18.07.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Apr 2025 18:07:01 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>,
	ghost <2990955050@qq.com>,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	Chao Wei <chao.wei@sophgo.com>
Cc: linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-mmc@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH 2/9] dt-bindings: interrupt-controller: Add Sophgo SG2044 CLINT mswi
Date: Mon,  7 Apr 2025 09:06:07 +0800
Message-ID: <20250407010616.749833-3-inochiama@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250407010616.749833-1-inochiama@gmail.com>
References: <20250407010616.749833-1-inochiama@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As SG2044 also implements an enhanced ACLINT as SG204, add necessary
compatible string for SG2044 SoC.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 .../bindings/interrupt-controller/thead,c900-aclint-mswi.yaml    | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/thead,c900-aclint-mswi.yaml b/Documentation/devicetree/bindings/interrupt-controller/thead,c900-aclint-mswi.yaml
index 065f2544b63b..d6fb08a54167 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/thead,c900-aclint-mswi.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/thead,c900-aclint-mswi.yaml
@@ -14,6 +14,7 @@ properties:
     items:
       - enum:
           - sophgo,sg2042-aclint-mswi
+          - sophgo,sg2044-aclint-mswi
       - const: thead,c900-aclint-mswi
 
   reg:
-- 
2.49.0


