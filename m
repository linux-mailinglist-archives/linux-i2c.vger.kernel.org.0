Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5913F433E3A
	for <lists+linux-i2c@lfdr.de>; Tue, 19 Oct 2021 20:14:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232170AbhJSSRC (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 19 Oct 2021 14:17:02 -0400
Received: from mail.kernel.org ([198.145.29.99]:44752 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231586AbhJSSRB (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 19 Oct 2021 14:17:01 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2E76C60FC1;
        Tue, 19 Oct 2021 18:14:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1634667288;
        bh=+SM1BWHbH2LUlxh8AtYn+MneiN1TVdwLnuJB4dZdQUs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=byfnkPVjenYe/JfxSbZWIYWne0Kj1sE8gy5KJkEspDbt86gRE/5YRaI4IFqG7XT39
         H+U6ywiTHOo3cmggSafvQ1R864AVq4QhVzKjzdU3eAaXAMaiGWi8jn/wr/4GE0AbuO
         eD3bj++jBVmIpgjjQV33Uc4G+yy9BI95RCAVCu0wwSgo8lSpWy8UyuJIQWGwxf1yDL
         9/qX2ll/3HCus5l9gzPpzBuVKZnTfSCjcSK+E9lGChMa1NIxIseia47gLJ8okGcjb/
         1RubxDJF+CpD27pzeQuVQqwBma+u4+ENVaQopx1C8Rno9+/qtS7iexES+DNFugwF7G
         l+6gUtZOFcmkA==
Date:   Tue, 19 Oct 2021 20:14:45 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Viresh Kumar <viresh.kumar@linaro.org>
Cc:     Greg KH <gregkh@linuxfoundation.org>,
        Vincent Whitchurch <vincent.whitchurch@axis.com>,
        jie.deng@intel.com, virtualization@lists.linux-foundation.org,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel@axis.com
Subject: Re: [PATCH 1/2] i2c: virtio: disable timeout handling
Message-ID: <YW8LFTcBuN1bB3PD@ninjato>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        Vincent Whitchurch <vincent.whitchurch@axis.com>,
        jie.deng@intel.com, virtualization@lists.linux-foundation.org,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel@axis.com
References: <20211019074647.19061-1-vincent.whitchurch@axis.com>
 <20211019074647.19061-2-vincent.whitchurch@axis.com>
 <20211019080913.oajrvr2msz5enzvz@vireshk-i7>
 <YW6Rj/T6dWfMf7lU@kroah.com>
 <20211019094203.3kjzch7ipbdv7peg@vireshk-i7>
 <YW6pHkXOPvtidtwS@kroah.com>
 <20211019143748.wrpqopj2hmpvblh4@vireshk-i7>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="Z4xbno6aVwUYspRx"
Content-Disposition: inline
In-Reply-To: <20211019143748.wrpqopj2hmpvblh4@vireshk-i7>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--Z4xbno6aVwUYspRx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> I think it is set to HZ currently, though I haven't tried big
> transfers but I still get into some issues with Qemu based stuff.
> Maybe we can bump it up to few seconds :)

If you use adapter->timeout, this can even be set at runtime using a
ioctl. So, it can adapt to use cases. Of course, the driver should
initialize it to a sane default if the automatic default (HZ) is not
suitable.


--Z4xbno6aVwUYspRx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmFvCxEACgkQFA3kzBSg
Kbb+yxAAoCt/AZ5kNarMw5Lh1QJZ/R1PY2mAkx/6X6xJdMtT2677sD7PqCNNnoaP
JoPHTZzPkX6UFFw15vgH8VNnTnMj1zAxmVQNJb2fCdYCYL1En/hoRLVkggrpQ66a
wOGtjwulBZmp1hHuaaPQT/92bRvG4RuMaBxU34wNq7qXC4PRQlQcxHn35+lHNpRW
vbxwpUOpgVvcWOYo4aIMZhanDLXQHJwuy0ZZlr5HLvNAvuPLLcf/dd5l0kWOO8Fh
Y2DmFeBMiduevRcd/dn3+dKts4ORn1mIqLPYaQaYgx8q9Mfy5HSYWgAPWYsW4bnT
8QAzud6HJuG+LJKiD+oqWgLA/HTjOq26plxGnsSGYB2q5iKaqL/qhyAymepAN7jF
m1dLSWSdj9++SeAAIOXCU+ux2corGHBcqs/JExwBgRYsh1am/sswZ+XA2/OknIpV
rXmlLdg1fjqud1EOXpLi70gp/Sxzp4TfknL7PXIwEOlOXcZ2+BV2600DyMQNf0Vc
5wsjESlpKcaiUxhyTPuYG0jUoqd2rWNtw4p8VUV4BPdDd7dAkrpeZe/Q+1IzjeCr
t/JUBeAJZr7g7fWIjos5ZiHDiWDvl1aOeFKAl+KpooasFQOUPI4I9w6ivGeqcVNC
ilP9Avt+vQFlbD7KpY8FQcOt8nLoayjh7cXJQTrlqAO7f7gl2Wo=
=Ji5I
-----END PGP SIGNATURE-----

--Z4xbno6aVwUYspRx--
