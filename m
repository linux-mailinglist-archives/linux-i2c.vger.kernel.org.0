Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2C83A1F87F2
	for <lists+linux-i2c@lfdr.de>; Sun, 14 Jun 2020 11:08:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726460AbgFNJIO (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 14 Jun 2020 05:08:14 -0400
Received: from mail.kernel.org ([198.145.29.99]:40390 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725265AbgFNJIO (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sun, 14 Jun 2020 05:08:14 -0400
Received: from localhost (p5486c990.dip0.t-ipconnect.de [84.134.201.144])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 683BF206B7;
        Sun, 14 Jun 2020 09:08:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1592125693;
        bh=n3wKxNIkrL79MBfu8VNibHzqLBHsYDEtzNsdn1+bG30=;
        h=Date:From:To:Cc:Subject:From;
        b=MwzA4lWmdKlzDuvDp/rQWKyGX/B5LpuRztl0h03Bnuv2BFvNQccvI8zDaVX6PhVYP
         OqSYTbStdNJpcix67C2skZ9kGELNieh9zTqtxXtrbgpTeY0G4HlA1xtEgrB2ctPH8j
         V30F3m4bHOiVpz7kxrx/CKUjmDdbAcoMK+Zy8wWo=
Date:   Sun, 14 Jun 2020 11:07:51 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     linux-pm@vger.kernel.org, "Rafael J. Wysocki" <rafael@kernel.org>
Cc:     linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org
Subject: RFC: a failing pm_runtime_get increases the refcnt?
Message-ID: <20200614090751.GA2878@kunai>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="1yeeQ81UyVL57Vl7"
Content-Disposition: inline
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--1yeeQ81UyVL57Vl7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Linux-PM,

both in the I2C subsystem and also for Renesas drivers I maintain, I am
starting to get boilerplate patches doing some pm_runtime_put_* variant
because a failing pm_runtime_get is supposed to increase the ref
counters? Really? This feels wrong and unintuitive to me. I expect there
has been a discussion around it but I couldn't find it. I wonder why we
don't fix the code where the incremented refcount is expected for some
reason.

Can I have some pointers please?

Thanks,

   Wolfram


--1yeeQ81UyVL57Vl7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl7l6OEACgkQFA3kzBSg
KbZYyA/+PkFktu53VSUsaXjSYl3UQhAp3f9gxaeCTcak82twshL7bPkzKzW7mzPu
EMkPt07vTWMlwl3kTclqzf0X3CB3nmTxxbsIkSUO1pUk2uFMSYew2zUpqGIKy7/J
RTGiLarBS+uQ6IlFVQn5/CgOJFhW3NzEeZ6ArtyD4rdOWI4Zyp9Xeh+W2g/ElQnb
BmDUv6rES6CpNNJitt9ZbcbgOKyDLFWwxIVFuAQCoqrsylsh13/A7+AfNfGP/biy
X2mRo1L/ZfbDJrRdSUel/9eUm5KvFNabPZCKP7xiIlJwaQ2RbeDuowC+lO5Nj9Hf
Vvd8LXdLOk1EDQ+kzGIXdJDThY+8ySBGvR06o5AJFYYTaocFKU6tEmsk/RVp+DXF
J7EZkpYBTyxg5C7iV6C9EkD8+TicENFYpJupkYC2ggZPrgK4qDo1EhUvT55hCgbV
C3yUcFqviNK9gsMPbJHfhoTW/XGSR62nBSdnZJYBzM36eXwNk01f1qO3eW60XO1m
vetWZfFBbPNPrNL8hGHwl5+5SOeuCKDIxz0deo4ff00cfkGhx35qJGDrvEoVv6lr
ptOzytwAjL+ZGaPbKHcQgGSDvY/7Zimsy2kuCn3KzV6p6KmIB8zscKENmVCPibSS
AeW3s7q2kuALMdLjlfDTUDZtFKsvfyvLkMo7OJuyixaSwNYRhso=
=CpY1
-----END PGP SIGNATURE-----

--1yeeQ81UyVL57Vl7--
