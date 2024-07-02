Return-Path: <linux-i2c+bounces-4575-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DD13923D2B
	for <lists+linux-i2c@lfdr.de>; Tue,  2 Jul 2024 14:05:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D6BD8285D24
	for <lists+linux-i2c@lfdr.de>; Tue,  2 Jul 2024 12:05:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F5A215B10F;
	Tue,  2 Jul 2024 12:05:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.b="AG6iB/2B"
X-Original-To: linux-i2c@vger.kernel.org
Received: from sonic307-32.consmr.mail.ir2.yahoo.com (sonic307-32.consmr.mail.ir2.yahoo.com [87.248.110.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA8DD15CD55
	for <linux-i2c@vger.kernel.org>; Tue,  2 Jul 2024 12:05:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=87.248.110.57
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719921909; cv=none; b=S2DR+HRRADunjnC82J+zAERhH4KjiNJrcdK3Kidfl8gMQSaT97AQ8Dx8mH+UHgMA7OD7wdroEArdBpy5h1sLwJF9H2rUtWfrJhhyrjCHp3bCvFcBqhtplVrpEVT/3qF9srXhRRoLIT1glrXjpXZ1yFX9e7mKRNdsuTChzsEtjtQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719921909; c=relaxed/simple;
	bh=czYlFkR7gACaffEBBYkZYMloku7B869PLgAxG+uGO7Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type:
	 References; b=VW1W+yZyAxHmjMR4wHVKuxP/65jHljyJ9Wo/p8rXHLz3KLCG7O10zz+yeqPqIaLq+yWEC0UD6NGFgDN3NAvsV3aeG+jjIWkJQyoTMpxLvDMDuhW24GRKsgaZkYzYXYw/D9MtXo4LVETYPi7Tp9BiYGj/ECCl9jtP52qCH9/ODj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com; spf=pass smtp.mailfrom=yahoo.com; dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.b=AG6iB/2B; arc=none smtp.client-ip=87.248.110.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1719921906; bh=J8LVgZXsBn/SKy0ON6Xyfp/jRyWWH2Gsbog4fAcslz4=; h=From:To:Cc:Subject:Date:References:From:Subject:Reply-To; b=AG6iB/2Be44NgTMz7FLsI3dCkiBLK3n0uhnZvmXuP9INowT3A2NVAsEjYm4Yo198fj4i2OzApagxUJSYCWEc2TV51/wqF7ocotkIGkKuXg/Im6E7p4DHpBLPhUqAGjap3AnCCfNJklWouD9roPrsnPRj0pSepMFnr7kjXXblLmUKDYwYI5sVtYv2pE4NSQsGp475OGFSB71TsIX34rjPNDHzEz3kFT+s7t6gAyCuqLHVAgzZHOgNx2eG1luz8TNyzLy9jtUOm+hdRpxJjdkbLGvkJ+aT7srYpfJN7/yd/EKCHS6N15jeJ1vEnEvNsl/Y3GWkTVO7c0cyVZM1cngHpQ==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1719921906; bh=L9O0rBaoDU3Rj60uwG1otmUwq6BZxoxRVnsp4VeF01g=; h=X-Sonic-MF:From:To:Subject:Date:From:Subject; b=hf2K6brFA78fMGDlxNdGAj3I5x8xoJD1GxBgV2dbNcSqTdoirvnBdb+g8Lv/6Oq23KEtJC5M2UhZsKo/UJUJ/6GhgrXH/mp3lJG+uJ/NagDEjrcGS+hpc+pReCsIDXarfRKYz19OiH2hbhO8mpxZbb/xhF4aKOpLC7HNtat5BKpDg+pKjUynf1x1B4Rgk6xvALXhktDR6gO9Yd4+z6XU+ge9tr068ekNAFqnqdr/VBLo3oC9v21eT2JivL4wo6H1P/IZk1+BlB26z2Yhgoh+ZXWnpK2t9uN4vjzAY+LjCXWleQGQweH2Uutfpil1wbyJbQGkQlrZBBswtI0lZpx+7g==
X-YMail-OSG: INJqqsoVM1nUAl02a13QJLORw6oGZokgB9tm0D_u0t7.L.3_e8rDkhW0asv59PQ
 wUB7ez8C6hw2C66ImTssx46a7xqfLZpGmx.b9PxJWj6kMkbk64d5wPuFePSRhmRcdNyCR1FYP5EV
 HPwhTSavDu9zWK73CFsTIJ76uI_LLg1EaSbwpwyGLYzIgOM5O.o_MIXcgvPiIhrYSw6mBe3lNrIF
 jgHTL6oGsYRrG2D7FPo2FJbsuP2dCxBIX8l3hRK4nry77Gx9Cpi8eApdfhHc5Jgot9uzDbvjykd8
 ySZnsdbxn6lXbl4uOmZEQBpslc7CVG1GbH8NXZj_PRXBf.WbA0XKOugzTRGPRKLYuH4F8W7EIf76
 vZuukz7ZQofO9EugcmV2HV2qCcV_GRAqahcjlPhP5aNzgE4c39JwdeBD5FLnLUS5lfhhCSFiF4kX
 Qdfp4Rwx_V3ygH.1g.xRcwtMO4HP7c253DxO8Y3FwdrS37n9AYS.B3ogqPOy94PCXTfSsrRmNsBw
 TDno83H0N_p37.mARmrXa5qZvxnLd8JobcTS9yViaetHuSpq0y6Rcrvv1xPOrPDSpAJnHrLXEJuM
 xiB35FeIU4WwsZ2RpttSmIkZxbfS2OdBkC3zcOkEhPh6c_EsjilB5uF4EPo0QRjjgclx4BEoSG2G
 RTomCdub9A2Kl5fXW3Iyb3JwTLzUuWcOAzIZiRCVb9wmbt.XPpwMNJVFm1WCH5tIg7mMY2ul5msE
 Y0cv0S2XxxVJ.raBl1mPpPlsr2tANCk5SoSzsfo0Ydc31xE_Mz6yk0rahRsWYlKm6iAP1FLq1_XN
 Gpbm_sXubjjeg4bvX1TUMCi6rUSBLa.DhK6TGHz9uAhOaEjFh8OMWTL4DwsRsg62nNPtgSCCOOZe
 O7PJHKPLTGt37sH21x0csJy6Oa20jG.gQeoRg_g9EranMPJDfS59anwWW7UzrDQOqOCsd6BRTVqr
 oejA9rlIXRU1awHyrz4ICGNPfb.6IpUeyAkz70QXHeV54M_asDv3Mr3vQR4xXWjokvgJnHZKPrAD
 vcYV_9rtdjJPgQBpVw79wTw.tr5FzF1jhyuiUiGfGeNCVg4DbOnoatnxnDxw3gtVgnCfR6HP_LEZ
 O_nOnTJ4z_58kWOuoNMRoanxUUk_a2mm2Ntyj4DIEVTnj9GKO6ndWlkxQO.kUEpUbWHvlFxKrjiT
 q1o6Lv5ZxlifJ3hRwcx_D2DdTs_1bQnDw6qvuAT4uOdIS.jLKi9DoabPle203FeAx_KQmUdOR8L0
 5lWF8Lzwg23ZDW1Hpxoxx.TNG74ZUD_t4AspQXJHWizYo0poqnlJ5zeaQZDelLEcrLvgNHGRe6Nr
 wpUHPQ9f2yQJDsQ3ADVppsNcRZME951iXAWtPRzry.Mtw.9T9zFWIHhA5pRnpIz174IvXawZnFRZ
 0QQDJ9F9nb_EUfzn6hVlslQ8hngLGtFw4VStOBn4e0l_BLdkRVNPLXAZdglMs.8lWSCOxyq5XNot
 T7uzchyjW7FpQm9NrgYIyrb22lSGN91uX9ujSf7D.BM4kv5_gt1plXDcEaVy.A0r7NsDgXofBZB6
 EnOk1gpi7SbbBRqv1.7sigXnuzeiJTsIN0oBSl62Y_lvcoXe9VAUni8IxulWDnYqdZjw.JoO80p_
 rWBlfnY3qLL3b_V_Iav0oYgVVx74zkvTHWY0tG3ytP8x0CqwROaETxlE8l0Wwz.MyeWCZwO3zyKk
 szoeKme69weeGHYsKK5klMTM98WrvkQNRxgGfL4WPfJob0q1ORg94cY0nEoRRfDydfq6YY7jlj17
 6pXXd9GpBoeTENmft6HgwEC4mlxBmTB7EwEU4xUYlJNa0oEr9Xu4IRCsTG_WP8_Z2DkWUDfb5Crs
 rRhr2isIezCmRjRJPjuFar.eAvUupu1ljHnjmeY_oMHAifaXy.Op1KhAEHRS4riDxqZZleB4HqZO
 S7w2nfRaXNrw.BTFuw_kRrFKfD9NGYerZ9rFIRRHox1cky96VzGe3aDFBUHJQ5sPtIXuvx08G5.j
 LfaBCHbFQnjWtjvgSI45zi1kt58OLLxOoH0s9wjdHRCWx3Zd6GMrpBE3z5zwYV08YN.UgdNk6UPg
 E3Ik49m7izLziYezWdonBe4OJf3z8yuPGwy3uED77zpFK4fr.PDwDg_xtZURZoRpfDkW.edw-
X-Sonic-MF: <xzeol@yahoo.com>
X-Sonic-ID: 22345d43-bb8b-4137-a272-4ea238d35601
Received: from sonic.gate.mail.ne1.yahoo.com by sonic307.consmr.mail.ir2.yahoo.com with HTTP; Tue, 2 Jul 2024 12:05:06 +0000
Received: by hermes--production-ir2-85cf877599-mvt7h (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID 0dd9cec1d13f3a8113ebc66190b2d374;
          Tue, 02 Jul 2024 11:52:55 +0000 (UTC)
From: Alex Vdovydchenko <xzeol@yahoo.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sean Anderson <sean.anderson@linux.dev>,
	Guenter Roeck <linux@roeck-us.net>,
	Jean Delvare <jdelvare@suse.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Delphine CC Chiu <Delphine_CC_Chiu@Wiwynn.com>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	Alex Vdovydchenko <xzeol@yahoo.com>
Subject: [PATCH v4 0/2] Add MPS MP5920 Host-Swap controller
Date: Tue,  2 Jul 2024 14:52:49 +0300
Message-ID: <20240702115252.981416-1-xzeol@yahoo.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
References: <20240702115252.981416-1-xzeol.ref@yahoo.com>

This series of patches adds the MP5920 Host-swap controller, which is used
as a protection and control IC for devices that are being inserted into a live
backplane. MP5920 acts as a voltage regulator (MP5911 etc) supervisor. IC
utilizes pmbus and provides monitoring, statistics and limits to electrical and
thermal characteristics such as:
- input and output voltage
- output current
- output power
- IC temperature

One must take into account the nonlinear character of readings, so there will be
a statistical error in the range 5–10 percents, depending on current passing
through. In order to use the IC, make sure to specify a valid I2C address
(consult to datasheet and dts-bindings)
MP5920 datasheet: https://www.monolithicpower.com/en/mp5920.html

Changes in v2:
  -  fixed typos
Changes in v3:
  -  removed unnecessary license blob
  -  removed unnecessary headers
  -  edited device tables style
  -  added chip name checking in probing
  -  fixed typos in pmbus_driver_info struct initialization
Changes in v4:
  -  added i2c_check_functionality in probing
  -  refactored usage of dev_err_probe insted of dev_err
  -  edited chip name string handling while printing
  -  restored .driver.of_match_table, keeping i2c_driver "old" style

Alex Vdovydchenko (2):
  dt-bindings: hwmon: Add MPS mp5920
  hwmon: add MP5920 driver

 .../devicetree/bindings/trivial-devices.yaml  |  2 +
 Documentation/hwmon/index.rst                 |  1 +
 Documentation/hwmon/mp5920.rst                | 91 ++++++++++++++++++
 drivers/hwmon/pmbus/Kconfig                   |  9 ++
 drivers/hwmon/pmbus/Makefile                  |  1 +
 drivers/hwmon/pmbus/mp5920.c                  | 93 +++++++++++++++++++
 6 files changed, 197 insertions(+)
 create mode 100644 Documentation/hwmon/mp5920.rst
 create mode 100644 drivers/hwmon/pmbus/mp5920.c

-- 
2.43.0


