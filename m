Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 952E62B09D1
	for <lists+linux-i2c@lfdr.de>; Thu, 12 Nov 2020 17:22:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729030AbgKLQWN (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 12 Nov 2020 11:22:13 -0500
Received: from mail-03.mail-europe.com ([91.134.188.129]:52608 "EHLO
        mail-03.mail-europe.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729051AbgKLQWL (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 12 Nov 2020 11:22:11 -0500
Date:   Thu, 12 Nov 2020 16:22:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=connolly.tech;
        s=protonmail; t=1605198126;
        bh=G5vIZonOu1YP1IFD5UKC7p+SMCBtaBVGRFKb/phoFDk=;
        h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
        b=A3CC7k+Nr4tS2kVm1B84u45rLjxXTIKOizlNks9oz0AdOIqj74aRSHUTgL642AWnp
         afuGJUS6keIxbJDYSjfo5x7tdyP3EcbpQEskT1Yz01JhFJvIt/8e821EmWCqJLYNRz
         zfahxVORYJLH63n/EKODUVhzpd0nlHPgh9IK7QAc=
To:     linux-arm-msm@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Akash Asthana <akashast@codeaurora.org>,
        Mukesh Savaliya <msavaliy@codeaurora.org>
From:   Caleb Connolly <caleb@connolly.tech>
Cc:     phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        Caleb Connolly <caleb@connolly.tech>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Reply-To: Caleb Connolly <caleb@connolly.tech>
Subject: [PATCH 5/5] i2c: geni: sdm845: dont perform DMA for OnePlus 6 devices
Message-ID: <20201112161920.2671430-6-caleb@connolly.tech>
In-Reply-To: <20201112161920.2671430-1-caleb@connolly.tech>
References: <20201112161920.2671430-1-caleb@connolly.tech>
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

The OnePlus 6/T has the same issue as the Yoga c630 causing a crash when DM=
A
is used for i2c, so disable it.

https://patchwork.kernel.org/patch/11133827/

Signed-off-by: Caleb Connolly <caleb@connolly.tech>
---
 drivers/i2c/busses/i2c-qcom-geni.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qc=
om-geni.c
index 8b4c35f47a70..9acdcfe73be2 100644
--- a/drivers/i2c/busses/i2c-qcom-geni.c
+++ b/drivers/i2c/busses/i2c-qcom-geni.c
@@ -357,7 +357,8 @@ static int geni_i2c_rx_one_msg(struct geni_i2c_dev *gi2=
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
@@ -399,7 +400,8 @@ static int geni_i2c_tx_one_msg(struct geni_i2c_dev *gi2=
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
2.29.2


