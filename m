Return-Path: <linux-i2c+bounces-2358-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8630B87C9AC
	for <lists+linux-i2c@lfdr.de>; Fri, 15 Mar 2024 09:09:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 47E44281C0D
	for <lists+linux-i2c@lfdr.de>; Fri, 15 Mar 2024 08:09:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15B6717581;
	Fri, 15 Mar 2024 08:08:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=uni-heidelberg.de header.i=@uni-heidelberg.de header.b="pX4ZOkts"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay2.uni-heidelberg.de (relay2.uni-heidelberg.de [129.206.119.212])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5B0917584
	for <linux-i2c@vger.kernel.org>; Fri, 15 Mar 2024 08:08:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=129.206.119.212
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710490128; cv=none; b=g3LNXd0uF8fYak5SZ1W8F5YzN2q52sf1EQ2LYIPOnthO9WTR4ViqbIDY5ln01lLs92ywzq7oQ1dqpYgMTczZX9lsJBs1pO+4ArpbddIhi9hZvOuOoCtDtqBtd+a/m1jKgdwhdWc4cVQAieoCHcsmy2j7TNVmD2wn1WvsW5yvSq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710490128; c=relaxed/simple;
	bh=iOJXZuIDFX1dec7OVhw5mjBdW0VSYHpePVXQD/gwgpo=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=EGv80T1QoiSa3A+7CYK5LLoa6Kmbb7ZMzbdc/U5xYgkzy8LREbtvqdJyYUP8PyWZVtntmvBMDvWGY6xFJwWICSM7FOBjMvOeZ8RL5LbOSYI1Ob78gNEHs5Szgm3g0Oayo508kGM/mKWRH1KN44Qe5GQKn0fRXIfnZ9iQssfdcio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=iwr.uni-heidelberg.de; spf=pass smtp.mailfrom=iwr.uni-heidelberg.de; dkim=pass (2048-bit key) header.d=uni-heidelberg.de header.i=@uni-heidelberg.de header.b=pX4ZOkts; arc=none smtp.client-ip=129.206.119.212
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=iwr.uni-heidelberg.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iwr.uni-heidelberg.de
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=uni-heidelberg.de; i=@uni-heidelberg.de; q=dns/txt;
  s=s1; t=1710490124; x=1742026124;
  h=message-id:date:mime-version:to:from:subject:
   content-transfer-encoding;
  bh=iOJXZuIDFX1dec7OVhw5mjBdW0VSYHpePVXQD/gwgpo=;
  b=pX4ZOktsrprQMSWGbblyeEWknqrcRQzwRN3J0zgbDmZn1LJUZCQz2B9P
   DISNuTjZyJzfZDbk4wejQzkWzaHzF0S5NrxrnvnIaCemFVsVcJp0KCJ4M
   ueylIrZbNO+AyYTN0/u9rVUVJ7hbYWf1aEJItMnUopz9iawGYqftdMbWj
   CdV/Xa72WkCE2UejfPHArBa6mh9HjhLqeC+EhpmKQS6QUL2Mj9jxKCMG6
   b7edw82Y+G5BbRNEdI1H7fp2nQQ/Kb2u4IZVy72T5VC7mSclH5T8sHPLt
   u3eP/D1+w3DX6Shv67X/yjkKCTdY8k3tJ1ghi5cWXzQkJBHTqst5Y38Gw
   g==;
X-CSE-ConnectionGUID: ylq9VxBIQhOs/FZZIaQRiQ==
X-CSE-MsgGUID: bgDhDgTgSXG/Q1Q+EHfScg==
X-IPAS-Result: =?us-ascii?q?A2D2BQCdAPRl/7gOzoFSCIEJgU+FFByEOJE6QZ90DwEBA?=
 =?us-ascii?q?QEBAQEBAQgBRAQBAY0KJzcGDgECBAEBAQEDAgMBAQEBAQEBAQYBAQYBAQEBA?=
 =?us-ascii?q?QcFgR2FeYZ4BAsBBVocAiYCXgESAgEBgnyCYJcYnDR/M4EBhHmuOYFqCQGBE?=
 =?us-ascii?q?C6IJgGBVokRgVVEgTwOh090gw6CaASCE4M7ng0JgUqBJGsbEB43ERATDQMIb?=
 =?us-ascii?q?h0CMToDBQMEMgoSDAsfBVQDQwZJCwMCGgUDAwSBLgUNGgIQLCYDAxJJAhAUA?=
 =?us-ascii?q?zgDAwYDCjEwVUEMUANkHzIJPA8MGgIbFA0kIwIsPgMJChACFgMdFgQwEQkLJ?=
 =?us-ascii?q?gMqBjYCEgwGBgZdIAcPCQQlAwgEAysnAyByEQMEGgQLB3iDPwQTRAMQgTQGi?=
 =?us-ascii?q?hyDGAIFI4IhgSlTAxkrHUACAQttPTUGAwsbSKRnU4EklXaTLp8ANAeCNYFgg?=
 =?us-ascii?q?VsGDJ8/BhMvl0MGkmQBmF8gqDMCBAIEBQIWgXqBfzMaJIM2UhcCD6IUdwI5A?=
 =?us-ascii?q?gcBCgEBAwmJTAGBGwEB?=
IronPort-Data: A9a23:LVA6CK+/SpPEJWVUJQE8DrUDSn6TJUtcMsCJ2f8bNWPcYEJGY0x3z
 2ccCmyEPfyPMGSnL91yOdm08UsGuMLWyNJrQQo5qH9EQiMRo6IpJ/zAcxiqb33ORiHgoOCLy
 +1EN7Es+ehtFie0Si+Fa+Wn9T8kk/jQGtIQMcacUghpXwhoVSw9vhxqnu89k+ZAjMOwa++3k
 YuaT/b3Zhn9hFaYDkpOs/jf8Eg24ayr0N8llgVWic5j7Qe2e0Y9Ucp3yZGZdxPQXoRSF+imc
 OfPpJnRErTxpkpF5nuNy94XQ2VSKlLgFVHmZkl+A8BOtiN/Shkaic7XAha8hXB/0F1ll/gpo
 DlEWAfZpQ0BZsUgk8xFO/VU/r0X0aBuoNf6zXaDXcO73knfIkX86dRXDGYteqMqyMd+OFtPz
 KlNQNwNRkjra+OezaKwSuBqicllMc/qeYMSu31tyTvUF/lgTZ2rr6fivIUJmm1o2IYXQbCHN
 5ZxhTlHNXwsZzVTOlANBdQ5mPuogXfxWzxHshSIo6ty42XSwAF12rX3P5zZd7RmQO0PxxjC/
 zqboDuR7hcyPtOzyRaKzn2XtsCIpHrCG68yGoaz+as/6LGU7jZKU0xLDgXTTeOCokGkVt1YM
 V1S8S4jqKU06GShSd7hWxy+5nWDu3Y0RMFZUPc37gyWw7H8+A+fCS0JSDFAbtErrs4wSnoh0
 Vrht9foAyF/9bzPQlqD+bqO6zC/Iy4YKSkFfyBscOcey8T5ssQoyx/fFo4+Vqe5yMDzGHTwz
 jGGoSw0iq8cy8IGv0mmwbzZqyOov8n3XiQU3wXwRSWL3DFYbbefZrX9vDA38s18BIqeS1CAu
 l0NlM6f8P0CAPmxeMqlHLhl8FaBu6ntDdHMvWODCaXN4ByB1haekW14/StsYVwsP9ZcIWKva
 UOVpAVQoZ9ePXenaaV6eY33B8lCIUnc+TbNCK68gjlmO8YZmOq7EMdGPx74M4fFyhhErE3HE
 c3HGftA9F5DYUmnpRLvLwvn7Zclxzol2UTYTo3hwhKs3NK2PSHMEetZaQLWP7hjsMtoRTk5F
 f4DaaNmLD0DD4XDjtX/q+b/0HhTdiFgX8CeRzJ/L7DbSuaZJI3RI6WImuJ8ININc1V9i+HJ4
 HynQU5EwVfjzX3KKAmHbnpucryHYHqMhSxTAMHtVH72s0UejXGHt/xCJ8VnI+R3r4SOD5dcF
 pE4RilJOdwXIhyvxtjXRcCVQFBKHPhzuT+zAg==
IronPort-HdrOrdr: A9a23:gbu+kayQTF4CjDkqg3TJKrPwBr1zdoMgy1knxilNoERuA6mlfr
 OV7ZAmPH7P+U4ssR4b6LO90cW7LU80lqQFmrX5X43SPjUO0VHAROoJgLcKqAePJ8SKzI5gPN
 BbEpSWZueeMbEwt7ec3ODxKadH/DBZytHTuQ8Op00dMD2CRZsQljtENg==
X-Talos-CUID: 9a23:xITAKG/3hCSIjxLMkxqVv18QA5EbYlf89Xf3OAiWO1RIQYSvSGbFrQ==
X-Talos-MUID: =?us-ascii?q?9a23=3A+QIrNg+Djdq6eVaYwRam6+KQf81nz6SCB3wCqqU?=
 =?us-ascii?q?p/PDdDG9dGzmmhzviFw=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
Received: from urz-s-ex005.ad.uni-heidelberg.de (HELO exchange.uni-heidelberg.de) ([129.206.14.184])
  by relay2.uni-heidelberg.de with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 15 Mar 2024 09:08:35 +0100
Received: from [129.206.104.130] (129.206.104.130) by
 urz-s-ex005.ad.uni-heidelberg.de (129.206.14.184) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.37; Fri, 15 Mar 2024 09:08:36 +0100
Message-ID: <c2aa287c-f576-4e9d-968a-7e412424a5d9@iwr.uni-heidelberg.de>
Date: Fri, 15 Mar 2024 09:08:35 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US, de-DE
To: <gregory.clement@bootlin.com>, <wsa+renesas@sang-engineering.com>,
	<linux-i2c@vger.kernel.org>
From: Thore Olthoff <thore.olthoff@iwr.uni-heidelberg.de>
Subject: [PATCH] i2c-mv46xxx driver
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: urz-s-ex004.ad.uni-heidelberg.de (129.206.14.183) To
 urz-s-ex005.ad.uni-heidelberg.de (129.206.14.184)

Fixing an inconvinience where a broken or loose connection could be only 
found with additional equipment
occured when working with i2c and not figuring out why a connection 
sometimes failed even thought the cables measured alright
enables developers to see the linestate on failure within dmesg no 
further equipment needed

Sorry if anything is improperly done. This is the first time I do this.


--- linux/drivers/i2c/busses/i2c-mv64xxx.c.orig    2024-03-15 
08:33:07.606227057 +0100
+++ linux/drivers/i2c/busses/i2c-mv64xxx.c    2024-03-15 
08:34:54.191439990 +0100
@@ -582,8 +582,9 @@ mv64xxx_i2c_wait_for_completion(struct m
              drv_data->state = MV64XXX_I2C_STATE_IDLE;
              dev_err(&drv_data->adapter.dev,
                  "mv64xxx: I2C bus locked, block: %d, "
-                "time_left: %d\n", drv_data->block,
-                (int)time_left);
+                "time_left: %d, LCR: %X\n", drv_data->block,
+                (int)time_left, (int)readl(drv_data->reg_base + 0x20));
+                /*LCR just a -> sda+scl low | 1a sda low | 2a scl low*/
              mv64xxx_i2c_hw_init(drv_data);
              i2c_recover_bus(&drv_data->adapter);
          }

Signed-off-by: Thore Olthoff <thore.olthoff@iwr.uni-heidelberg.de>


