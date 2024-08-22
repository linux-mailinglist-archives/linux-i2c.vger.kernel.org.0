Return-Path: <linux-i2c+bounces-5661-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D4C9E95B376
	for <lists+linux-i2c@lfdr.de>; Thu, 22 Aug 2024 13:08:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 944071F22540
	for <lists+linux-i2c@lfdr.de>; Thu, 22 Aug 2024 11:08:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48E591802AB;
	Thu, 22 Aug 2024 11:08:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DXkTNMjt"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71C7D178372;
	Thu, 22 Aug 2024 11:07:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724324880; cv=none; b=EewdryICgePHpserHpe9ioXPiewsI8bofiGkhLUggid4Bevf0cvENnjnf5kdQI7H4uLziCZPCRqOtR6NlEPo3P2xOz6/rob8Y6sIDdgmpSZpXsZmXtx8pGY0fbH6eVE46f2UZGRGlm2+DbwPHqUPcBEOd7CnETsSaxu6zQJCaR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724324880; c=relaxed/simple;
	bh=9o9vX73qQ0xPZivCudFLswGZR+ZgzahslDW/ZVYd0hY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PcQJbxzjz1ALP0m1aMFN/BX/EJYf7eGipvCV/utPvTjLDA/VdOzOrPhr79w03Lt8U8z6xm4c/BS9IEAcjs2qc2/jWmlG9jSHZr+V+e5ogfXWO6kkyaFNi0Pzr24gBgEDmpx6MPoAH8ZEagoDg1V7ESOZH0ZJCDwe6Nnjt/kuMqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DXkTNMjt; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-53351642021so455127e87.3;
        Thu, 22 Aug 2024 04:07:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724324876; x=1724929676; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kWaGIP6dDqiqkhtgs+gT8HH4PnvScWFmXNsEH5TKZxE=;
        b=DXkTNMjtxdDJxJtkYJ8xwIdue+bWNkjp3DNd2jAelx7sCvgU3VZ/p4X+zIPDvpBvi2
         FMqgYGPFeSzR9t8Q9lPwiy94JCjtJgPAuGRRu1X/l3PpPJ5KNS8ihZMF2czX/Uft1O+Q
         DB23HKHOU5bNsSIo6QWoGg2EkjtkbSQRvSK0nYzeh8sX1rbuyz1c2g9XHA3XUBcLE8pw
         n8KnpDQkFlOC+zDyJc+4jmsJ2qK7Vny8ycVhek+NE9crzDxVUpQ0195ScW8wMkzoIjCM
         T3p6T5MyRYtpZ4jctZg9VsL+p8ezE8KQJOXnsh4I1eetmPM+ldBymyU+QM97yDX2wmuP
         0/dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724324876; x=1724929676;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kWaGIP6dDqiqkhtgs+gT8HH4PnvScWFmXNsEH5TKZxE=;
        b=WUuAoNQehivZAejeOQ03PTTmYxc7GKVkQxLB7Onted4YVOWx1Y1iEQJf6J4zsfR1l9
         u+DDOSpvfC+5SxNytQnqWUbvEGmi1brS3T57QvOxCgEQ9ltkuer7DBJxM1Horw4P2HCi
         74DlrLuR3NDqV+yDqST2oOEBFhUTdXosEJfyRtrbocw8q6lWbzxu9mzxIPLMChViW+Lm
         W7G5aQUcm5dlV+46PBRS5Ck1GrV6lXHqVvWVeXqPO2HGTuzTXQT5MIkKamte5f+lQidW
         T4pjGZ524T2HrYjk+xFnAguLBB0jnbf7PE3oZPNmnDNWpfOAA2okRMh8DRcnr93ogfbJ
         pQUQ==
X-Forwarded-Encrypted: i=1; AJvYcCX7yH8Af4HO2xEFNKPj9jaXNARYLEn3P8jnz/0uRn0AeRvTbdx1xzl7WwaQ0KdHkSAzzXkSWm/yYc4=@vger.kernel.org, AJvYcCXd9n90uty1ZHpEQOMwKmv23UeCEzlyR9BXfijqcjVyWMekx2LftT+ZWOlT2cLEMOPms/gtx9mPemFl9G6F@vger.kernel.org
X-Gm-Message-State: AOJu0Yza7aTDx4iogNCNq4ZhRlsZykHVfu6ulPQeH9Y2QkAvGuNRaEvS
	vlOvhnf61l1nRJ/bJyxAc9C83+ZpRb31AHrYXfQTOBo8GX3XdzB5tGdZR54lEsFWlipbKGE3Zno
	d169O1P6/SFe6pR7wxjc0TAbRGjM=
X-Google-Smtp-Source: AGHT+IHxKn71fneXC0mOrCUQ8O/UhiKqicMYXk24eeQeis0vIsw8HOfefDPZQlRbqHP/GYh/E3J4H1ACbYbxJuMH6XA=
X-Received: by 2002:a05:6512:3d91:b0:532:ef22:eb4e with SMTP id
 2adb3069b0e04-5334859576bmr2742345e87.54.1724324876122; Thu, 22 Aug 2024
 04:07:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240819072052.8722-1-eichest@gmail.com> <20240819072052.8722-2-eichest@gmail.com>
 <CAOMZO5CYUNESmBdZBMSMwNraQbqvvsF5fn8i+nHr=MB_T_AG7w@mail.gmail.com>
In-Reply-To: <CAOMZO5CYUNESmBdZBMSMwNraQbqvvsF5fn8i+nHr=MB_T_AG7w@mail.gmail.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Thu, 22 Aug 2024 08:07:44 -0300
Message-ID: <CAOMZO5CeT+LvQ__3GUf6teL3=8pZe5qxmFffYJX-h3E27UXwtQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] i2c: imx: only poll for bus busy in multi master mode
To: Stefan Eichenberger <eichest@gmail.com>
Cc: o.rempel@pengutronix.de, kernel@pengutronix.de, andi.shyti@kernel.org, 
	shawnguo@kernel.org, s.hauer@pengutronix.de, Frank.Li@nxp.com, 
	francesco.dolcini@toradex.com, linux-i2c@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Stefan Eichenberger <stefan.eichenberger@toradex.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Stefan and Oleksij,

On Wed, Aug 21, 2024 at 8:01=E2=80=AFAM Fabio Estevam <festevam@gmail.com> =
wrote:

> This fixes a pca953x probe error on an imx8mp board running linux-stable =
6.6:
>
> [    1.893260] pca953x 2-0020: failed writing register
> [    1.898258] pca953x 2-0020: probe with driver pca953x failed with erro=
r -11
>
> Could you please add a Fixes tag and Cc stable so that this can reach
> the stable kernels?
>
> Tested-by: Fabio Estevam <festevam@denx.de>

I am sorry, but I have to withdraw my Tested-by tag.

For debugging purposes, I kept 'fw_devlink=3Doff' in the kernel command
line and that's what made it work.

Removing 'fw_devlink=3Doff' I still get the probe failure, even with all
the series from Stefan applied:

[    1.849097] pca953x 2-0020: supply vcc not found, using dummy regulator
[    1.855857] pca953x 2-0020: using no AI
[    1.859965] i2c i2c-2: <i2c_imx_write> write failed with -6
[    1.865578] pca953x 2-0020: failed writing register: -6

In my case, I can get the pca953x driver to probe successfully in one
of the following cases:

1. Select pca953x as a module instead of built-in

or

2. Pass 'fw_devlink=3Doff' in the kernel command line

or

3.  Register the i2c-imx driver as module_platform_driver():

--- a/drivers/i2c/busses/i2c-imx.c
+++ b/drivers/i2c/busses/i2c-imx.c
@@ -1586,17 +1586,7 @@ static struct platform_driver i2c_imx_driver =3D {
        .id_table =3D imx_i2c_devtype,
 };

-static int __init i2c_adap_imx_init(void)
-{
-       return platform_driver_register(&i2c_imx_driver);
-}
-subsys_initcall(i2c_adap_imx_init);
-
-static void __exit i2c_adap_imx_exit(void)
-{
-       platform_driver_unregister(&i2c_imx_driver);
-}
-module_exit(i2c_adap_imx_exit);
+module_platform_driver(i2c_imx_driver);

or

4. Use the NXP vendor kernel imx_6.1.22_2.0.0 kernel

Stefan, do you get the arbitration errors if you try methods 2 or 3 above?

