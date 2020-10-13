Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A1FF728D18E
	for <lists+linux-i2c@lfdr.de>; Tue, 13 Oct 2020 17:54:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729372AbgJMPyJ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 13 Oct 2020 11:54:09 -0400
Received: from mail.kernel.org ([198.145.29.99]:41908 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727016AbgJMPyJ (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 13 Oct 2020 11:54:09 -0400
Received: from localhost (dyndsl-091-249-035-207.ewe-ip-backbone.de [91.249.35.207])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 6CA1E25215;
        Tue, 13 Oct 2020 15:54:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1602604448;
        bh=trQOVCfY7quismV6EFJLZYCRoqbFMFBZuwroBsLlQXk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=0kx25ZycPbfKI57m16/MizCeX6undrJikhtC1/6PMcHbuvDoojeIJt33jcVj7dyqY
         8Tds4rJ9V8md2TQ6uyj2LwgSqtm+ub8CrArNHHGEQhfG0RDMMnYv82rPhVu46gxqJV
         AbY0Ni7oe6OYo3jTrGI3Mz18cc03qwzcAtL+W4Ag=
Date:   Tue, 13 Oct 2020 17:53:58 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Balbir Singh <sblbir@amazon.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 13/24] docs: i2c: index.rst: add
 slave-testunit-backend.rst
Message-ID: <20201013155358.GA1465@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>, Balbir Singh <sblbir@amazon.com>,
        Thomas Gleixner <tglx@linutronix.de>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <cover.1602590106.git.mchehab+huawei@kernel.org>
 <8b46f6d001962e7b562c3542eb4449bd905f448a.1602590106.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="jRHKVT23PllUwdXP"
Content-Disposition: inline
In-Reply-To: <8b46f6d001962e7b562c3542eb4449bd905f448a.1602590106.git.mchehab+huawei@kernel.org>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--jRHKVT23PllUwdXP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> Fixes: a8335c64c5f0 ("i2c: add slave testunit driver")
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

As discussed with v1, I already fixed it (correctly). Patch is in
linux-next:

https://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git/commit/?h=i2c/for-next&id=40daf09a30a0c86a038bcce606604333f32e03f8

Thanks!


--jRHKVT23PllUwdXP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl+FzY0ACgkQFA3kzBSg
KbaaXw/9GVxvuUSDOgJD2XFZbvdWzUHyr58OcfG6bnfRZrlD8RJPLSmGUTA8xsLr
5AbQG5y18J84KIiUqQpfFXR8Tie0NmTb7cCzCz5S/uTTzuCNNt/WU04OCDdTrbFV
ZkfxZV3chY+oo7yDRCsGzSNDj3Wn0MQlp5MKnSXjRoQAihxId0ePRSQ9F+r/vWlt
wqpCN6kDFZrjKZESDlY6CReVpvt4VHzQfW8O2NzlSUgkP3c08xBa0ILRNZGC2wUs
Cw4mngubxrXvFCt5i/p+a797GbB5rsamwu0inmnoDYD92+BDJpJicf5GsxeO1Z/B
RpETW9U6lQZZ1AqolS0hLwt4BULgU5QQSUx9to7O6mcvI/0jLApRi60X5baf5rny
w3W/spX6FzPBzrrwucQxg5/RpJIirTa8RANtXChGwcVFxucvX0nXEWS/URiejy8t
nVL9wnCinWtBAR3/sYeOSy0jpUuNJ0EusOKdwiPZbZxz50zs4Da5l+ER3ZuTjtlB
AXU1fzYl4OH041qioAyJOuXf6GV5YZJm+P3xPbc55gnTqLTC3tqmm5Uk8lq0X1aT
VPvR1Xq3c55uUG8rBfR2HMh07jETerLuTd71plQz6yV0IpiwzSSd6fBVrI1K6fRX
c2a4HsBmTaZ9fkQMxQ9Lby+ktflUXf0GX/E7k0TErp2gC08yg4Q=
=0/8Q
-----END PGP SIGNATURE-----

--jRHKVT23PllUwdXP--
