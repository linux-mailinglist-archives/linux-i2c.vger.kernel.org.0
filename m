Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 99FA531B99
	for <lists+linux-i2c@lfdr.de>; Sat,  1 Jun 2019 13:41:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726180AbfFALlA (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 1 Jun 2019 07:41:00 -0400
Received: from sauhun.de ([88.99.104.3]:49358 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726134AbfFALk7 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sat, 1 Jun 2019 07:40:59 -0400
Received: from localhost (unknown [91.64.182.124])
        by pokefinder.org (Postfix) with ESMTPSA id 6BDAD2C54BC;
        Sat,  1 Jun 2019 13:40:58 +0200 (CEST)
Date:   Sat, 1 Jun 2019 13:40:58 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     linux-arm-kernel@lists.infradead.org
Cc:     linux-i2c@vger.kernel.org
Subject: Re: [PATCH 0/8] arm: add I2C DT binding docs to various platforms
Message-ID: <20190601114057.GD1993@kunai>
References: <20190521082137.2889-1-wsa@the-dreams.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="cQXOx3fnlpmgJsTP"
Content-Disposition: inline
In-Reply-To: <20190521082137.2889-1-wsa@the-dreams.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--cQXOx3fnlpmgJsTP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, May 21, 2019 at 10:21:29AM +0200, Wolfram Sang wrote:
> Some I2C drivers entries in MAINTAINERS miss their DT bindings docs.
> This series fixes that. Because these drivers are all embedded in their
> platform entries, I suggest the respective maintainers pick them up via
> their tree. If you prefer that I take them via I2C, let me know.

Series applied to for-current!


--cQXOx3fnlpmgJsTP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlzyZEkACgkQFA3kzBSg
KbZBKQ/+J6xdC3F2JIYkJ0e0Ru0FGHiSqVM11jQh/EUyMUWXXwTdyNBO3qyENIEO
sVFLcJSINSMYWAEB2KR1qnhCYC8JVNSmhy5/hbc5Qhl5AOAQ6gv7m2zEnX0R3S0V
dJc0+xXhOQZWQZdG033+MAKdlMcz+1EslOs4JnHCWBQcT9saB3jlk2zEY1VLnJEK
xgM/TvQGA3WL1FNtHBn7hdb0ZmcxBlIeHvW7WefoVLCeK2r+05k/UzfW+pDMhZB5
+K7uU4g9wyXA1U+KSHtnZyqUtv2XxnRHMNdwG7LMHq5oTLynqu168odEkTDMaaI6
lXjqMIN9iZVD5OqNbugLbVHBSdxcmFqcmvUxXtQhL2/+tH0x9c2BFPqqlB0BhcVm
uMwGwkE5AQbO/Foide6AOBtHAXrjCy2pZPbktW2BQIE2Cc7VkIWRo2URZsdrS+nL
t8cgYYMDi3dIlfdU1n1KMyTuO6fspbTPHa8tP0dDlux0o6A38yRLbTWs1VFimhS/
Y0+nkBY0oCbmoBXcEwGr1iSkby4MJRxzwj0m850k6rCtq8kMziBgJVetzHHPoRU3
gjgCgr+LMqwItJ79LeWv9nevjJIwMLhxuq8ivzGMOT/udJTUSZ41laXY2kv9ZXsg
O1jQhoR5bjZrCZ5GIeJ9MJfdSHIG3vUUf1Fl/A0QrzDJFgIgljY=
=zv7P
-----END PGP SIGNATURE-----

--cQXOx3fnlpmgJsTP--
