Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AF73A456A1A
	for <lists+linux-i2c@lfdr.de>; Fri, 19 Nov 2021 07:14:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229865AbhKSGRd (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 19 Nov 2021 01:17:33 -0500
Received: from new4-smtp.messagingengine.com ([66.111.4.230]:47515 "EHLO
        new4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229760AbhKSGRc (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 19 Nov 2021 01:17:32 -0500
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
        by mailnew.nyi.internal (Postfix) with ESMTP id DF1C658091A;
        Fri, 19 Nov 2021 01:14:30 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute6.internal (MEProxy); Fri, 19 Nov 2021 01:14:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.in; h=
        from:to:cc:subject:date:message-id:mime-version
        :content-transfer-encoding; s=fm1; bh=bgWuFoLEb87DsIPJtjpr2qz3Xy
        aQqedmbsGqM77Zh9M=; b=no1YhPc0az9k3uzn7dlt/fUx6yd8UbiF89VRaAsHtO
        rCcgXQacUEQIkEWr/JsCl+9JHY2vGEm0Vduk3uJ7uliVdc8yTaAgto8Mf8iVSHD1
        5vPYQ3BmwIJdMpJaeOzZdL+gS4OoX2v0/1BDqcCS8GIeyW9AXiBDrul4XA5DIcfc
        LIh4Xu/UqYBbvvNpPwmiYbW+ahaOQB9a9ZKdYrNqy21ilzYnSnwx4BL7aKEIkfw4
        8uWttpxQSG4GTELs3QoeezCd0Fd0ydggBxW97v/7BB8oduyH8m0V3rLWhyAluAzR
        HeKxdBrwhHQo34ITze3Fo+kSsRI/dfBDw5eFjLHdc1Cw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
        :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=bgWuFoLEb87DsIPJt
        jpr2qz3XyaQqedmbsGqM77Zh9M=; b=ApM3oOl0fiFY0rU74OxwqKqtJHjPHvRLI
        rlhAxJisc40CmvDzlgB6SImhCTRenEQB+yMQOi8wqv8zSXOX82ahCB6xig0iH8uS
        qiwZjxu31sihtRWbgZi+Jjac/W4/f7rbAR8Vp4ChWvHSf5IqXNFCSTQumAlaZ1+X
        bVVT+9omON9/NjT+n+83WWUJGcsAOz0kkQR3Wtuwcyt7kLsbM5OIBdueS/3aILZ0
        jWh9uwcqXrjXDS+ecwp/CdmWNWZyVuFov6x0Xb2lJVi6G9OZQ2ZOZlc+ppmTDYTM
        2tJw9/RJZ2IvNlvkW4Iwi/T5lipokywliLW4p3a4zC89DlQ7izJMg==
X-ME-Sender: <xms:xkCXYbHW0z4TPlN8cTm_EsJ5cjoHEcDreq2_Hjhh4z22jyTz4zc3Tg>
    <xme:xkCXYYWLN8SxxKAvs0jaGPHX0xYIAUhwBAPOTKidOIlKfQe-zn4cH6ftbPZMtJW9i
    C5kz8e9JSmtrIrlLGc>
X-ME-Received: <xmr:xkCXYdI9_F49szZQ6gmZYcdFnhj_GbdC5kT5L6kktEFDaozIdx-JzJT0TQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrfeejgdelvdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffoggfgsedtkeertdertd
    dtnecuhfhrohhmpeffvggvphcuofgrjhhumhguvghruceouggvvghpsehfrghsthhmrghi
    lhdrihhnqeenucggtffrrghtthgvrhhnpedvvedtkefhteeggfehveehgeehgeeigfekke
    fgteejleehffffffeggfdtheetleenucffohhmrghinhepnhigphdrtghomhdpphholhho
    lhhurdgtohhmnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrh
    homhepuggvvghpsehfrghsthhmrghilhdrihhn
X-ME-Proxy: <xmx:xkCXYZFqbG9LIoIBfiZ_9OIzdOhiz8RhxX9g2IC-LBKJXRFnt3BCzA>
    <xmx:xkCXYRVq1xBwKFTEfj9vKxBqgEfJIZs-WLLKTP60qHAHZzbXEa0oYA>
    <xmx:xkCXYUOlSTfz_ZEOZ4L3N0mWnEEa8wI3GnHK4-dIlKZZtCgv8XYTpQ>
    <xmx:xkCXYURQekMirRyjs576zUr2gIMqwycOvrq1aGCoxq8ECNf6Nv-yrA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 19 Nov 2021 01:14:29 -0500 (EST)
From:   Deep Majumder <deep@fastmail.in>
To:     wsa@kernel.org
Cc:     linux-doc@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, Deep Majumder <deep@fastmail.in>
Subject: [PATCH v2] Docs: Fixes link to I2C specification
Date:   Fri, 19 Nov 2021 11:44:01 +0530
Message-Id: <20211119061401.19852-1-deep@fastmail.in>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The link to the I2C specification is broken and is replaced in this
patch by one that points to Rev 6 (2014) of the specification.
Although `https://www.nxp.com" hosts the Rev 7 (2021) of this
specification, it is behind a login-wall and thus cannot be used.
Thus, an additional link has been added (which doesn't require a login)
and the NXP official docs link has been updated. The additional link is
not the Wayback Machine link since it seems that the PDF has not been
archived.

Signed-off-by: Deep Majumder <deep@fastmail.in>
---
 Documentation/i2c/summary.rst | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/Documentation/i2c/summary.rst b/Documentation/i2c/summary.rst
index 136c4e333be7..3395e2e46d9c 100644
--- a/Documentation/i2c/summary.rst
+++ b/Documentation/i2c/summary.rst
@@ -11,9 +11,11 @@ systems.  Some systems use variants that don't meet branding requirements,
 and so are not advertised as being I2C but come under different names,
 e.g. TWI (Two Wire Interface), IIC.
 
-The official I2C specification is the `"I2C-bus specification and user
-manual" (UM10204) <https://www.nxp.com/docs/en/user-guide/UM10204.pdf>`_
-published by NXP Semiconductors.
+The official I2C specification (revision 7) is the `"I2C-bus specification and user
+manual" (UM10204) <https://www.nxp.com/webapp/Download?colCode=UM10204&location=null>`_
+published by NXP Semiconductors. However, you need to log-in to the site to
+access the PDF. An older version of the specification (revision 6) is available
+`here <https://www.pololu.com/file/0J435/UM10204.pdf>`_.
 
 SMBus (System Management Bus) is based on the I2C protocol, and is mostly
 a subset of I2C protocols and signaling.  Many I2C devices will work on an
-- 
2.30.2

