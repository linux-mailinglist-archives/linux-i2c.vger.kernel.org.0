Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DBAF825C43F
	for <lists+linux-i2c@lfdr.de>; Thu,  3 Sep 2020 17:07:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728387AbgICPHV (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 3 Sep 2020 11:07:21 -0400
Received: from www.zeus03.de ([194.117.254.33]:39886 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729104AbgICPG1 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 3 Sep 2020 11:06:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=H4fD0Ad9Kc1LxgRH/ncS+dBbAokU
        qUtXtvWfSCK6PZw=; b=bUiRNf0jRI+TrEOZQGvP6xsSwNdgi4hFUjUbEHIPM2C8
        3qQST5WWNgYMtrRs+8cqi9s7Fw29YhE7xPt+nRe2RtwNq36+n3tfLLodKuHEZrPr
        pBmp6aPI9mozcqUrny5QRbsuoawdilNZSlAYWrQTazQ8XlG5DtCQAunSGzyg988=
Received: (qmail 3278700 invoked from network); 3 Sep 2020 17:06:19 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 3 Sep 2020 17:06:19 +0200
X-UD-Smtp-Session: l3s3148p1@gQk1GGqu1t4gAwDPXw9AAMxnKm8HDZ7K
Date:   Thu, 3 Sep 2020 17:06:16 +0200
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Jean Delvare <jdelvare@suse.de>
Cc:     linux-i2c@vger.kernel.org
Subject: Re: [PATCH i2c-tools] add BUGS section to manpages
Message-ID: <20200903150616.GA3382@ninjato>
References: <20200806145421.1389-1-wsa+renesas@sang-engineering.com>
 <20200903153423.0cf6d9c6@endymion>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="vkogqOf2sHV7VnPd"
Content-Disposition: inline
In-Reply-To: <20200903153423.0cf6d9c6@endymion>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--vkogqOf2sHV7VnPd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> 2* Add my address to the BUGS section of the manual pages, together
> with the list's address. That should work for the time being, but I
> don't feel too comfortable with my name being put forward that way,
> plus this will require updating all files whenever the maintainer
> changes (don't panic, I have no plan to leave, but no one can tell what
> the future holds).

I think let's go this way. For consistency, and because it is less work
for me and you. I don't have an issue with the maintainer being more
visible, and the changes (when they come) are just more work for sed,
not for us :)


--vkogqOf2sHV7VnPd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl9RBmQACgkQFA3kzBSg
KbYYNBAAhp6nZKKLxHYM143ad1mZF+ONWe20mEx88FkWglD0twnZaibJxwP3qDXk
Ia3qFy5DUFDxcomrAAt8WLX76XILVgtfENmviN/4L9QXomIhP4agjGm8MKzYDrJU
BeVO/yZ8dlW/IeVVUH14TKJ0eKro+B2hSFkrjw1lybsllvfANj5bVYdSdVBEo3Rj
Kip4tKSdkvCuk7cRoYrgq68lWp68LZwPPT+ufIiwZ/KCe0TvbHVCzpyL7CJsT3ue
C7o6BpO589fKTyyWv2uW58XqzZBgFvXPLtVgDoBcMwpDzeAhTbbPEVOd3PRewUhP
CzC2DthbfnXUtSQlRZdtDiCGpwMzWDlKtfT2NC9oAK9m5EeBivvZddxAQp/4Zgvi
bw5hzOIK58BfkGjKx5lGOtGiETFItKNYPK9PDNukdzooxUNBjxli9Nr0SpeynmP3
CqBcx5iNrRnDwygDLx588P4Z6frGyo/1/WcX77qUbY7iQX+95GOXjbziwXENouoo
+gRiUAntQgABwQUl09j4vDP9jpH2kI+bzM/XlS2o5PV4NsnZP9f/i3P9P61dD0td
hS85sJC+RvPqRq8CV4R56cmVQiWQNI3/0AN/XmH/pzIoX3VgOcwLOY3SRu2miPDY
omB+k6A4NsNu5tU5ZAosD4hpQXxpiM6YauhLaJ66hAZWglrBcSI=
=7x7e
-----END PGP SIGNATURE-----

--vkogqOf2sHV7VnPd--
