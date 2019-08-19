Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0972B94D42
	for <lists+linux-i2c@lfdr.de>; Mon, 19 Aug 2019 20:54:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728022AbfHSSxh (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 19 Aug 2019 14:53:37 -0400
Received: from sauhun.de ([88.99.104.3]:54502 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728014AbfHSSxh (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 19 Aug 2019 14:53:37 -0400
Received: from localhost (p54B3355A.dip0.t-ipconnect.de [84.179.53.90])
        by pokefinder.org (Postfix) with ESMTPSA id B2B332C2868;
        Mon, 19 Aug 2019 20:53:34 +0200 (CEST)
Date:   Mon, 19 Aug 2019 20:53:34 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Cc:     acooks@rationali.st, Jean Delvare <jdelvare@suse.de>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
        platypus-sw@opengear.com, "Tobin C . Harding" <me@tobin.cc>,
        Guenter Roeck <linux@roeck-us.net>,
        Will Wagner <willw@carallon.com>
Subject: Re: [PATCH v5 0/3] Enable ACPI-defined peripherals on i2c-piix4 SMBus
Message-ID: <20190819185334.GA9762@kunai>
References: <20190802145109.38dd4045@endymion>
 <b013c33b-da11-ce5e-08d4-0b24a8575109@metux.net>
 <db725a3b-7b6e-ac79-ef1c-e601ff45c0f2@rationali.st>
 <9019cce9-837f-97fc-0f3b-7503b8fc3717@metux.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="ikeVEW9yuYc//A+q"
Content-Disposition: inline
In-Reply-To: <9019cce9-837f-97fc-0f3b-7503b8fc3717@metux.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--ikeVEW9yuYc//A+q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


Just so I get this correct: This is all about instantiating the devices
sitting on the SMBus, but you are okay with Jean's patches? Or is this
discussion affecting patch 3? (/me knows not much about ACPI'n'stuff)


--ikeVEW9yuYc//A+q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl1a8CkACgkQFA3kzBSg
KbY6QA//TCiu9vQeJOGQgAjCErp1jEtzM7G2eOtCIz31KD3tbpJDXUyAHrjoBwai
izxywtv6hSPtFWeIHFYXH1Hd4PNMjdzpYkLTdRKHV8yktp9vJqiddk9+L6L/NXGo
ay4/6jJXudfZA78P0JLpSuP0V7HpyLPPI012MWszClhN4HSmW9lw+8ibZZ208mre
uIp5VmxHkfLKIaSu6cB2OHiOgNxybgQY7JFapdenXsIwaW96Y8+zEl/SWF7Ok5Nr
gwQT8lkCtCFR6Lbg0cIaNyemkJZXMcelDDNGRsxaZ+JnruqyRjd0yfu8vBClpqHf
IXaz38fFe8fgT9EOBnPWwfruQuvjkOr8QEbd7qP+k6VXObi1bERQwdUATYVHrAWj
ld+/uYMKEXipSirF81l3gqpgissz3sxvaTdmNz8Yng9YoW6xo2wS6YB8ivIr4HFe
J/JXR1/zX0LQgS64tYTt03t3Cy9Q1D6J1AsO0OIh6xjR5f4VMWbLk20XVmFgMpP2
LFcna5IjHr004TT6PNtfC7fNt4pWX87737peOAiJGPyvBtNcktta7UbifLP+Zl4R
Izhxf9rFMYUGHzGPqdt7jDZQevblhMkyUK555z3h1C08dsUgF1Puoygkc1mi0Ngm
BveEGVLqZCOpkPFYWWA6g5fFgFAlT7J+yYNRCRlmLb92akbjIX0=
=8gua
-----END PGP SIGNATURE-----

--ikeVEW9yuYc//A+q--
