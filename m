Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 868301EB602
	for <lists+linux-i2c@lfdr.de>; Tue,  2 Jun 2020 08:51:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726267AbgFBGuv (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 2 Jun 2020 02:50:51 -0400
Received: from www.zeus03.de ([194.117.254.33]:39942 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726262AbgFBGuv (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 2 Jun 2020 02:50:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=RCJHqL+Z886EHM5VavwMg5JSQmFl
        gh6yghG4/1fgO/Y=; b=WLn12D3gdpiklh/rB0ofFBfjjniDNBWXUExYpv4L0v7r
        s9El1nV159A7w0NQ54ecFVZhGEQaWY18vYOHK2+zwju+Un3yA6nFuMOEJG4TkKuk
        50+juBsczSUCLVLJUKUKmGaMc/WWdPghGfQRWFG7wZCGtnuoXhf1XgHXT5JQK8Q=
Received: (qmail 848087 invoked from network); 2 Jun 2020 08:50:48 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 2 Jun 2020 08:50:48 +0200
X-UD-Smtp-Session: l3s3148p1@LYrfVBSnzqogAwDPXw/+AIHdrwCIvkcp
Date:   Tue, 2 Jun 2020 08:50:39 +0200
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Viresh Kumar <viresh.kumar@linaro.org>
Cc:     Vincent Guittot <vincent.guittot@linaro.org>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: sh_mobile: Fix compilation warning
Message-ID: <20200602065039.GA1453@kunai>
References: <f526f90ea62741716de2ecfa310ba22d8cf1d3c2.1557377015.git.viresh.kumar@linaro.org>
 <20200529121245.GA20272@ninjato>
 <20200601035922.5eovt7yt2qcokglo@vireshk-i7>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="4Ckj6UjgE2iN1+kY"
Content-Disposition: inline
In-Reply-To: <20200601035922.5eovt7yt2qcokglo@vireshk-i7>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--4Ckj6UjgE2iN1+kY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> Almost after an year, wondering on how you reached this patch now :)

Another developer sent the same patch. And last time I was unsure if I
liked the new code better (for reasons I can't recall anymore); this
time it was clear to me.


--4Ckj6UjgE2iN1+kY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl7V9rsACgkQFA3kzBSg
KbZSeQ//SctheGbskJsU8buEoMEThvQrHHrv23uhQrYS00mn+CFJT4kqK8b0HrVE
lQCx4RoTYPdM7JUH+TdB/Swev826GP+cQQU3z6PhNcjxTc6JqQs4p/uUJicHYhqS
QIyGP44i2VhPlawz4dBQp9FwNeqXL6ydQ9k4kEGVVY3/X5/hCVjbONIr+I+cpUSZ
nq9Qw/zZsqq4daGlrgVyT5x/r/BBBea3JELZ6NOaN783Bb8Pv9xd/Kk3AEokEqGy
QEqFPGE5pcgjA16CjhTEDco58lV3XVoQkOBC67QiptxRUjdQyO86InGh/jDNfUvz
iOeuFr7YRU0B6P8mKe1X9zakqozQW841SJIH6sXbxMMPcqMghWcrfbCgveaKgPi8
J62uI/Xj9xyvuV7iPVKJzV+iq6+QdD+j4XuMNPcmk6GWj5vgK/D1AyPb83m79btp
0JmuK97dnnameNNrqUjFXW1J9mqE76XvZ8J8RiGMq1h05lXXCp62R1W2V09ztRoj
BqfV338+Z4kTIMqbyetGDYNEPqlVp3gl3An3iFhCMU1Vne+qiIaKo5329wIUlejU
8cFEpg5IroTOup8n5hTjBspA0aXkzw1lPrroWpBAqn1kmsqa85RfIJR70utXU+J5
JOKjL2qLKp3cLnkduensQVCST4XsNpcMj2wox/24kw8SJM/sL3E=
=+/dw
-----END PGP SIGNATURE-----

--4Ckj6UjgE2iN1+kY--
