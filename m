Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 486772865C7
	for <lists+linux-i2c@lfdr.de>; Wed,  7 Oct 2020 19:21:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727970AbgJGRU7 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 7 Oct 2020 13:20:59 -0400
Received: from mail-41104.protonmail.ch ([185.70.41.104]:11242 "EHLO
        mail-41104.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727891AbgJGRU7 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 7 Oct 2020 13:20:59 -0400
Received: from mail-03.mail-europe.com (mail-03.mail-europe.com [91.134.188.129])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits))
        (No client certificate requested)
        by mail-41104.protonmail.ch (Postfix) with ESMTPS id E5DA420035C1;
        Wed,  7 Oct 2020 17:20:56 +0000 (UTC)
Authentication-Results: mail-41104.protonmail.ch;
        dkim=pass (1024-bit key) header.d=connolly.tech header.i=@connolly.tech header.b="V2BIlimC"
Date:   Wed, 07 Oct 2020 17:20:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=connolly.tech;
        s=protonmail; t=1602091253;
        bh=UHVeS8mhguivBrMvSGJLXZGFXdxxnZc9zuVyS2Pzp9c=;
        h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
        b=V2BIlimCjeDjKFKCRlR4nwVZwK4a/wJwL5PzhTUiKr0vG0V8VpBtvfRGxTmbs/lWw
         NuLPb0dx7zykJWJhaW4k4HpeYLvF268FgLvZ7LWdOWo4SUOlj9sfwCjhTwqF0kG6VG
         b5QBD2n3vG3wOMrfE3LvGAMrpdXe+1vhrrN0kYUk=
To:     Akash Asthana <akashast@codeaurora.org>,
        Mukesh Savaliya <msavaliy@codeaurora.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
From:   Caleb Connolly <caleb@connolly.tech>
Cc:     ~postmarketos/upstreaming@lists.sr.ht,
        Caleb Connolly <caleb@connolly.tech>,
        linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Reply-To: Caleb Connolly <caleb@connolly.tech>
Subject: [PATCH 5/5] i2c: geni: sdm845: dont perform DMA for the oneplus6
Message-ID: <20201007171807.285298-6-caleb@connolly.tech>
In-Reply-To: <20201007171807.285298-1-caleb@connolly.tech>
References: <20201007171807.285298-1-caleb@connolly.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF shortcircuit=no
        autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
        mailout.protonmail.ch
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The OnePlus 6/T has the same issues as the c630 causing a crash when DMA
is used for i2c, so disable it.

https://patchwork.kernel.org/patch/11133827/
Signed-off-by: Caleb Connolly <caleb@connolly.tech>
---
 drivers/i2c/busses/i2c-qcom-geni.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qc=
om-geni.c
index dead5db3315a..50a0674a6553 100644
--- a/drivers/i2c/busses/i2c-qcom-geni.c
+++ b/drivers/i2c/busses/i2c-qcom-geni.c
@@ -358,7 +358,8 @@ static int geni_i2c_rx_one_msg(struct geni_i2c_dev *gi2=
c, struct i2c_msg *msg,
 =09struct geni_se *se =3D &gi2c->se;
 =09size_t len =3D msg->len;
=20
-=09if (!of_machine_is_compatible("lenovo,yoga-c630"))
+=09if (!of_machine_is_compatible("lenovo,yoga-c630") &&
+=09    !of_machine_is_compatible("oneplus,oneplus6"))
 =09=09dma_buf =3D i2c_get_dma_safe_msg_buf(msg, 32);
=20
 =09if (dma_buf)
@@ -400,7 +401,8 @@ static int geni_i2c_tx_one_msg(struct geni_i2c_dev *gi2=
c, struct i2c_msg *msg,
 =09struct geni_se *se =3D &gi2c->se;
 =09size_t len =3D msg->len;
=20
-=09if (!of_machine_is_compatible("lenovo,yoga-c630"))
+=09if (!of_machine_is_compatible("lenovo,yoga-c630") &&
+=09    !of_machine_is_compatible("oneplus,oneplus6"))
 =09=09dma_buf =3D i2c_get_dma_safe_msg_buf(msg, 32);
=20
 =09if (dma_buf)
--=20
2.28.0


