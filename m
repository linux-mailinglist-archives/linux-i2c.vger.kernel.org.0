Return-Path: <linux-i2c+bounces-2880-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E525E8A0771
	for <lists+linux-i2c@lfdr.de>; Thu, 11 Apr 2024 07:03:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EEF1C1C23807
	for <lists+linux-i2c@lfdr.de>; Thu, 11 Apr 2024 05:03:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B405A13C687;
	Thu, 11 Apr 2024 05:03:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="D29mvb7p"
X-Original-To: linux-i2c@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B459413C677
	for <linux-i2c@vger.kernel.org>; Thu, 11 Apr 2024 05:03:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712811792; cv=none; b=Efe2GjWpMWJn4TpZfOkOH+5yDxVxixtT/Xzs73q8WLu+84PjZql6QoOrXPF2WA7MiDas4wSDu9o0dOnuvyNByKNSFICAxWas0HMXj8T/7uTjENz3+jsoIotvoLH7vkRreOy6EpqpPAqXLG8cfKYW8JjEu9sGHpp5tFheVvvp6C8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712811792; c=relaxed/simple;
	bh=TvH6TCVgnMATPSKOuH94vxgD6+OFPlbAAQCEQs9hoqc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IZ/bIfTO9mb+xzwf4Ro1nSkPSXKkItNkq6NLXOBnxTZvUT0Dney6mmDXztywH+4YAU0ikMfeRYYKNcHCAsJLKmjPqbNpOKpy57A2q2CZIL5mAIhRPaRt9zFg2OjAHOvA2Xk8vKdm8rqnxeJl+G88d1Wv5w7hyFnWLBvPHyDUYRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=D29mvb7p; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1712811789;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=oeHu73ZcJFVvJyZ55x/dnWlLLWe8HGo5I+YvO7V0U40=;
	b=D29mvb7ptQIPmeYO/y+AaqM/iVslSBZ5pxUhP6t0Cnjoe+aX7TMceGoD3B8mWf7gU3nVoy
	AHMT/V8iYNKZZn6DSMhT53PclqUoMiMuLf0pewd+jeVmP5IEFZmLLC4gpMgHx+wSCvy5bW
	59nmQ0hSndgwELzr+6wlVPBuFuA5CtM=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-614-WiNSxZ-aPGGoffYWCx5nqg-1; Thu, 11 Apr 2024 01:03:06 -0400
X-MC-Unique: WiNSxZ-aPGGoffYWCx5nqg-1
Received: by mail-ed1-f72.google.com with SMTP id 4fb4d7f45d1cf-56e40f82436so2036004a12.1
        for <linux-i2c@vger.kernel.org>; Wed, 10 Apr 2024 22:03:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712811785; x=1713416585;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oeHu73ZcJFVvJyZ55x/dnWlLLWe8HGo5I+YvO7V0U40=;
        b=JL5Jb2vsCvnAOkZRcjkc5R+4CqVbIz4tA2G5TSsQHc376uy3tZ/OWD2dV9PW1of7/S
         nAhtL57k1Ouffc1srymbkf9zzVN6Uyp+dCgJDLkDDypbQaT5b8/xT9+nx87OLTyD+btF
         Nf8nCxUnSHJJuoNA5TJVt/knxLsxZVLvw2x9hdUm61lPtQVBS7G03e2Mj9xUXpBhjh29
         D3KBNQ4LSn/Gwg4pZpqQdlLaJT+0OIsBRAkFCTD3r82XaYBdLw+HZEaqC2lZS5CdocXH
         4fxWZ+sgKUpya0FOqP+x0MSRVOj2d+I1DS1+0LI2h1KZjYgvErJ32ZT3VCGZuG6CvE/V
         x2rw==
X-Forwarded-Encrypted: i=1; AJvYcCXhjqZ2javZ1sFjcbUiLB+nN1E3wTTj1yN0y3ahqP/JH5eoCEdkBfC47bJL+uBu1IAsshtu1ADoEZjPXHSD3nbSF7F0GVVj3Qlk
X-Gm-Message-State: AOJu0Yx5BFVdfZ9b761ubOntQj25ZOscZG9RHGCD/0ZmerCSgM4v5+oS
	DQJ+f5ckPYRHuOA0rJILSEiGMoZqiWqcuw5vsDNMtbVOA34lDduTJLwOnJM3t34E7j/uA+sYBSE
	dQzT1TpM6iP2Saqhk88lsQvvxJgmOR/MyyUF0eA3vWmhxFqaIpL7fN1rOEQ==
X-Received: by 2002:a50:a451:0:b0:568:3362:ccd1 with SMTP id v17-20020a50a451000000b005683362ccd1mr3738114edb.1.1712811785468;
        Wed, 10 Apr 2024 22:03:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFYDiEm5uYLCp9Y2cNrKiKw+GCEoP2XQC/NiQOax90o2ewqRFDQclGGyG9LYC0R8itI1t1O2Q==
X-Received: by 2002:a50:a451:0:b0:568:3362:ccd1 with SMTP id v17-20020a50a451000000b005683362ccd1mr3738099edb.1.1712811785138;
        Wed, 10 Apr 2024 22:03:05 -0700 (PDT)
Received: from lbulwahn-thinkpadx1carbongen9.rmtde.csb ([2a02:810d:7e40:14b0:4ce1:e394:7ac0:6905])
        by smtp.gmail.com with ESMTPSA id c1-20020aa7c741000000b0056fd8155792sm323337eds.25.2024.04.10.22.03.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Apr 2024 22:03:04 -0700 (PDT)
From: Lukas Bulwahn <lbulwahn@redhat.com>
X-Google-Original-From: Lukas Bulwahn <lukas.bulwahn@redhat.com>
To: Animesh Agarwal <animeshagarwal28@gmail.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	linux-i2c@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lukas Bulwahn <lukas.bulwahn@redhat.com>
Subject: [PATCH] MAINTAINERS: adjust file entry in ARM/LPC32XX SOC SUPPORT
Date: Thu, 11 Apr 2024 07:02:57 +0200
Message-ID: <20240411050257.42943-1-lukas.bulwahn@redhat.com>
X-Mailer: git-send-email 2.44.0
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit 20c9819ccd9e ("dt-bindings: i2c: nxp,pnx-i2c: Convert to dtschema")
converts i2c-pnx.txt to nxp,pnx-i2c.yaml, but misses to adjust the file
entry in ARM/LPC32XX SOC SUPPORT.

Hence, ./scripts/get_maintainer.pl --self-test=patterns complains about a
broken reference.

Adjust the file entry in ARM/LPC32XX SOC SUPPORT after this conversion.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@redhat.com>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 06d685a97b4b..edf6176a5530 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2360,7 +2360,7 @@ M:	Vladimir Zapolskiy <vz@mleia.com>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 S:	Maintained
 T:	git git://github.com/vzapolskiy/linux-lpc32xx.git
-F:	Documentation/devicetree/bindings/i2c/i2c-pnx.txt
+F:	Documentation/devicetree/bindings/i2c/nxp,pnx-i2c.yaml
 F:	arch/arm/boot/dts/nxp/lpc/lpc32*
 F:	arch/arm/mach-lpc32xx/
 F:	drivers/i2c/busses/i2c-pnx.c
-- 
2.44.0


