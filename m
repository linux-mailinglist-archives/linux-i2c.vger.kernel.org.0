Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3B9C5462087
	for <lists+linux-i2c@lfdr.de>; Mon, 29 Nov 2021 20:30:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234663AbhK2Tdx (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 29 Nov 2021 14:33:53 -0500
Received: from sin.source.kernel.org ([145.40.73.55]:41614 "EHLO
        sin.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234229AbhK2Tbw (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 29 Nov 2021 14:31:52 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id AB143CE139A;
        Mon, 29 Nov 2021 19:28:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65B93C53FC7;
        Mon, 29 Nov 2021 19:28:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1638214109;
        bh=2bPVsYZGEvkL7ytZo1aPhJLz8c1dMzifaUDBAFLBItw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=RtS0hE/RdKbW2RIa+5sY4JhJGIASzeNdLiXgnE2CvByw5/D6yWy1yzpalKRn7eIMI
         LBfNJFBa/8ahvFMiZSN0JY93AiP9IHv58oIPdGp3ATx0sxVXkZCsKmjuw6MVJcBVBl
         igGqH+VxeubgN/PW78WX3y5fsc49drl9BCBY9Y2Ql0mctKfRBSjXAiqnQMHcQFPwHD
         bbelxeaP7FWqlm4zt3oBJZfjWfZ38IHBATxez5NOyzZzWgpEpzDWfxiY8HGBr8UzVy
         Q9izPxPeZqy8ONCM3oje/wWR3bXUKBvTgCkQeXKqXiOU82uvA+jSLslVMo/tfwNJYY
         qxCTfJbPIhv7w==
Date:   Mon, 29 Nov 2021 20:28:26 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     "Lawrence,Wang" <lawrence.wang@nokia-sbell.com>
Cc:     jarkko.nikula@linux.intel.com, andriy.shevchenko@linux.intel.com,
        mika.westerberg@linux.intel.com, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, Wang@wrlinb193.emea.nsn-net.net
Subject: Re: [PATCH] i2c: designware: Get HCNT/LCNT values from dts
Message-ID: <YaUp2pFmrDJhv4T+@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        "Lawrence,Wang" <lawrence.wang@nokia-sbell.com>,
        jarkko.nikula@linux.intel.com, andriy.shevchenko@linux.intel.com,
        mika.westerberg@linux.intel.com, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, Wang@wrlinb193.emea.nsn-net.net
References: <20211115093556.7154-1-lawrence.wang@nokia-sbell.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="rJlXTTk3u6DNV2nZ"
Content-Disposition: inline
In-Reply-To: <20211115093556.7154-1-lawrence.wang@nokia-sbell.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--rJlXTTk3u6DNV2nZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> +	ret = device_property_read_u16_array(dev->dev, "dw-i2c-scl-timing",
> +					(u16 *)&i2c_scl_timing, sizeof(i2c_scl_timing)/sizeof(u16));

Putting hex values directly into DT is not a proper binding. They need
to be more generic. Sadly, I don't know the DW hardware, so I can't be
of much more help. But Andy already gave some pointers, as I saw.


--rJlXTTk3u6DNV2nZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmGlKdoACgkQFA3kzBSg
Kbba/w/8CVu53eC17FKot1rqbl6DF8+zh83feyfclXNWwPPu82Nr0jZBNDz+Mnbg
enjpxSnqEFVInmwS+yQ2SNkgMtbovCMXuUigYbJrfZl310+ku2b/lcD+v14wmLJE
DrrPoVDBa4UB4hq5zwvEbtXtd+XjGuQyABJUMo7iALfDjkgT/bkSBaGyPE4z3wNU
0HI0U8fFkvX/dQ1nFlaehJoQEeZuhoy6gzKy+kIn1rTNUiBsQBAqV+IagDkGH5Uf
PpjC0J7ZhbgZnjGwG7ISA0kJJnCWLfUpTOTCkKWB9xa4Dk4Hx4WBc1fAydjcwNrF
LB8Nn62NovLSGoVENEBwnX5bNk+MbJUlX7karobnDcoc8XAzRVrGOvRy6BfNRAu+
KowQEndq4FHmCH0CuzYxUF3y3AJmJxkCJx8LCStaIZ6lJd6+Ymt4jHWgo5cUDkyF
t4XzV/pNJ51ONFBzzV+kxHXGFv0cvVqDm3OTgAA0OSta9wW66NvaDkLqQsVd9G4y
c7TAcTYT/16n9dHyrvkDEZ373bhjF/JFW9Z4BOAzCYKWBlgV8fpi8KDUJT4nJoeX
yIDuRmsDthDu7pH4p5aXf4IQyq33/edA3TI/MlV0dMV/YYT5gRTO6Blbs/q2lQt9
ETbiAUpslY+nAU+cim4pbJgAwBejQA679D8QrhhhqM3Sg9Tyagg=
=Np68
-----END PGP SIGNATURE-----

--rJlXTTk3u6DNV2nZ--
