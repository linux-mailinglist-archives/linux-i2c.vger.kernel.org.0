Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0EAC517EAFA
	for <lists+linux-i2c@lfdr.de>; Mon,  9 Mar 2020 22:16:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726157AbgCIVQe (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 9 Mar 2020 17:16:34 -0400
Received: from gate2.alliedtelesis.co.nz ([202.36.163.20]:57069 "EHLO
        gate2.alliedtelesis.co.nz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726118AbgCIVQd (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 9 Mar 2020 17:16:33 -0400
Received: from mmarshal3.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 676A0891AD;
        Tue, 10 Mar 2020 10:16:30 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
        s=mail181024; t=1583788590;
        bh=MZ7ObcxH9/7KbiTLeat8dMylYC5m9Hprb4RjmO9ZzFc=;
        h=From:To:Cc:Subject:Date;
        b=TR4Td2qP/S28PWVSzBDICJu0oYKP+wJo2vGokY9pDrPWTOk8uHjmehdVChYL7egfU
         TtZWN7JPPp8b/hdk6K8BFZtXNxyDJ2c0Hg2R2nqusLebJL4rcWgUr1+rkBfPEcG4P0
         PQ/i+xnk4pXSWMDG3zRvwWz2pVJ408gO8wm7CIwhE/oLbeFaKJKpQc4+D1qI4JdhJ9
         H2tk3b7u//Bhefej9kD0DT1CJeFJfXOhdOAuENRbuywhSlQSFQFYpZ6LzepfaY83Mo
         /VVjkxFBjrJkKT4GY4xExQiFPIu1GL0A0lCSIJfltfnTtBpQOp9K8pWguD+TFdYv61
         RaCNJXvBKM4EA==
Received: from smtp (Not Verified[10.32.16.33]) by mmarshal3.atlnz.lc with Trustwave SEG (v7,5,8,10121)
        id <B5e66b22e0000>; Tue, 10 Mar 2020 10:16:30 +1300
Received: from hamishm-dl.ws.atlnz.lc (hamishm-dl.ws.atlnz.lc [10.33.24.30])
        by smtp (Postfix) with ESMTP id 91B4A13EEB7;
        Tue, 10 Mar 2020 10:16:29 +1300 (NZDT)
Received: by hamishm-dl.ws.atlnz.lc (Postfix, from userid 1133)
        id 24EF1540533; Tue, 10 Mar 2020 10:16:30 +1300 (NZDT)
From:   Hamish Martin <hamish.martin@alliedtelesis.co.nz>
To:     wsa+renesas@sang-engineering.com
Cc:     linus.walleij@linaro.org, linux-i2c@vger.kernel.org,
        Hamish Martin <hamish.martin@alliedtelesis.co.nz>
Subject: [PATCH] i2c: gpio: suppress error on probe defer
Date:   Tue, 10 Mar 2020 10:16:18 +1300
Message-Id: <20200309211618.25535-1-hamish.martin@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
x-atlnz-ls: pat
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

If a GPIO we are trying to use is not available and we are deferring
the probe, don't output an error message.
This seems to have been the intent of commit 05c74778858d
("i2c: gpio: Add support for named gpios in DT") but the error was
still output due to not checking the updated 'retdesc'.

Fixes: 05c74778858d ("i2c: gpio: Add support for named gpios in DT")
Signed-off-by: Hamish Martin <hamish.martin@alliedtelesis.co.nz>
---
 drivers/i2c/busses/i2c-gpio.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-gpio.c b/drivers/i2c/busses/i2c-gpio.=
c
index 3a9e840a3546..a4a6825c8758 100644
--- a/drivers/i2c/busses/i2c-gpio.c
+++ b/drivers/i2c/busses/i2c-gpio.c
@@ -348,7 +348,7 @@ static struct gpio_desc *i2c_gpio_get_desc(struct dev=
ice *dev,
 	if (ret =3D=3D -ENOENT)
 		retdesc =3D ERR_PTR(-EPROBE_DEFER);
=20
-	if (ret !=3D -EPROBE_DEFER)
+	if (PTR_ERR(retdesc) !=3D -EPROBE_DEFER)
 		dev_err(dev, "error trying to get descriptor: %d\n", ret);
=20
 	return retdesc;
--=20
2.25.1

