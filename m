Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 424E8227E72
	for <lists+linux-i2c@lfdr.de>; Tue, 21 Jul 2020 13:10:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729559AbgGULKP (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 21 Jul 2020 07:10:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51622 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729864AbgGULKO (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 21 Jul 2020 07:10:14 -0400
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 60ED4C0619DC
        for <linux-i2c@vger.kernel.org>; Tue, 21 Jul 2020 04:10:14 -0700 (PDT)
Received: by mail-pj1-x1044.google.com with SMTP id k1so1405536pjt.5
        for <linux-i2c@vger.kernel.org>; Tue, 21 Jul 2020 04:10:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pesu-pes-edu.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:subject:message-id:mime-version:content-disposition
         :user-agent;
        bh=3CBZPGL5d6hwqUDVQf1lPGnGhUogur2vcGo2sPX9F9E=;
        b=l6+3xCMydvzwsMfOzMRMKYiv1Z74ACZaoVLaVjS/qH/cR58TlQT4Uj/mUXoRXIvSvp
         mElmGqxQjHNq9oOujpcDKjMUoie11dYWJfQr3WyTBKqlRXqOg4aEWafUHioQ5jXVAp4b
         suaIGbKdWaH9yLGwiX7FnTmOY2vvLi9ikykgb/rXr6DBNaDFqMyb/Obqf5r+BfN9vwhy
         lCo5MraQ4DWWwpkF9rpvxD4cOAb3yl36NFk91voNYo05rNzx+iwn+lX67vb16zFYCU+A
         4aYcxKJf0xbH6NI9eIqoeFfbLp6LYpfq/BJ1pU4wU2duKO14zkPmjCCtj98CpRDiCylX
         yVZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:mime-version
         :content-disposition:user-agent;
        bh=3CBZPGL5d6hwqUDVQf1lPGnGhUogur2vcGo2sPX9F9E=;
        b=eIKVWQRMZG3psYyVMLbEwcAOVzPftsiWpeaqemdR0v91RYOlKKmp1FR8JAGKPTLTg8
         21xhDKxHHy37yI8tfeHFsPF9GolLPv0MlD2eArFerC+FNnud301W8OZfADCEQ3NttBhG
         CScuuoe/TxC5KnnkE9tj2ZbP4tMvKgo8eQEbayECsCbv23HB7EXvkl9mbMvvUU1V1wmS
         AjwWGcHegvNfpKPQaT6NSjuZXRAvwc8kiRptKRi/cd1qiE8BnShtSFhde8JysIigBPc5
         Tdcllx58m0pHrrWAAD2QAQ6D22xKTaZC1l7PwkkshhdbCEQt7+5y+d7tmMp7mXNoNzW/
         IF4w==
X-Gm-Message-State: AOAM5334+GAQdDpOZfn0wXC/HAvT9ijSfirIV6MLyp4JBzhUk/JqO4jB
        nWBnMLXqj8xATULy0hvHAgM83A==
X-Google-Smtp-Source: ABdhPJzoDkvC2oMdbgPOg0rH0eKjMrwxi1AGt41QnQjR7P4TZDmlCcIh7dmckU2TxKJ6LbwMkruLDg==
X-Received: by 2002:a17:902:b943:: with SMTP id h3mr22286097pls.38.1595329813520;
        Tue, 21 Jul 2020 04:10:13 -0700 (PDT)
Received: from localhost ([2406:7400:73:d7b6:d055:3e56:d1e4:ce99])
        by smtp.gmail.com with ESMTPSA id h3sm2874310pjz.23.2020.07.21.04.10.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2020 04:10:12 -0700 (PDT)
Date:   Tue, 21 Jul 2020 16:40:07 +0530
From:   B K Karthik <bkkarthik@pesu.pes.edu>
To:     syzbot+e74a998ca8f1df9cc332@syzkaller.appspotmail.com,
        syzkaller-bugs@googlegroups.com, gregkh@linuxfoundation.org,
        skhan@linuxfoundation.org,
        Dan Carpenter <dan.carpenter@oracle.com>,
        Mike Isely <isely@pobox.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] i2c: fix WARNING in pvr2_i2c_core_done
Message-ID: <20200721111007.hwwdveqxeqcry4wn@pesu.pes.edu>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="ut3ssk6bs5fsawxc"
Content-Disposition: inline
User-Agent: NeoMutt/20180716
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--ut3ssk6bs5fsawxc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

#syz test: https://github.com/google/kasan.git usb-fuzzer

fix WARNING in pvr2_i2c_core_done by
unregistering device in the release handler
instead of the disconnect handler.

Reported-by: syzbot+e74a998ca8f1df9cc332@syzkaller.appspotmail.com
Signed-off-by: B K Karthik <bkkarthik@pesu.pes.edu>
---
 drivers/i2c/i2c-core-base.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
index 26f03a14a478..2d377d2e89f1 100644
--- a/drivers/i2c/i2c-core-base.c
+++ b/drivers/i2c/i2c-core-base.c
@@ -462,6 +462,7 @@ static void i2c_device_shutdown(struct device *dev)
=20
 static void i2c_client_dev_release(struct device *dev)
 {
+	i2c_unregister_device(to_i2c_client(dev));
 	kfree(to_i2c_client(dev));
 }
=20
@@ -1527,7 +1528,6 @@ void i2c_del_adapter(struct i2c_adapter *adap)
 		dev_dbg(&adap->dev, "Removing %s at 0x%x\n", client->name,
 			client->addr);
 		list_del(&client->detected);
-		i2c_unregister_device(client);
 	}
 	mutex_unlock(&adap->userspace_clients_lock);
=20
--=20
2.20.1


--ut3ssk6bs5fsawxc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAEBCgAdFiEEIF+jd5Z5uS7xKTfpQZdt+T1HgiEFAl8WzQ4ACgkQQZdt+T1H
giHdCgv/R4BJLHuPsoUuC8vZDeVvtdVKXC5EZyGFmlVFnlBontVfMBrg5azCTEXv
QtjdDpjpmJ5fK6KOcS0nk9AWqRueMGg8eW1pkE8uiCR30ERA9ZEdsW5SyH9d3BzS
2jOp5WQvbnEsdub+adY4DTQHXusNoly5+F/Dd2eT2wJGXMsiYySrwQ3TeQwgNZhn
EQJbMTjEoHWYEMcB6CgnIKSjRjfGT6tD4Rn9EKSNypQri0L8HbbdFd46br6dXvKp
FOYheMB5HHGWhgVjBSztTz+YZyHgogM+oVTLVU2AQCSZ7lHFpN+0ImfFeh5qOiQN
F5qK0soYYB7+ffuCABF+qwChK6lUzX5baavMoFNSsFmY6ZnHnF6Lmg+DJh4t9oku
4/qqn8JctjgZqqfzErKGou7LbZvqOzvo5+iDDHi9skxa8tlrCEF0oTYgdkROqGzq
RGhTMRZY2pS8sd5I2h6daK7UV4dboBOB9SJGtv6QLoBwR4WTfQuMrEj3FQeaQDpa
iRRFHUV5
=aiG8
-----END PGP SIGNATURE-----

--ut3ssk6bs5fsawxc--
