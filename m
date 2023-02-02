Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D142F6888FE
	for <lists+linux-i2c@lfdr.de>; Thu,  2 Feb 2023 22:28:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231237AbjBBV2x (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 2 Feb 2023 16:28:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38964 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229667AbjBBV2w (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 2 Feb 2023 16:28:52 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E1AD2712;
        Thu,  2 Feb 2023 13:28:51 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id E2FFCB82877;
        Thu,  2 Feb 2023 21:28:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C54CC433EF;
        Thu,  2 Feb 2023 21:28:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1675373328;
        bh=gD76h/gyjU/IEyZAlO8ggqYtCIKdxOpVuYEk+LVtfLA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=lhxQOwrzjuhuZgPa/wsprZbhc1HcFAMJAQznHqM/4nhkbD5tn7bzZbLq9QVQgDWmQ
         Q2IQZT1xjLuWQ6G+A4ay5vRbHzZ8CGNX1QRESaj/YockHJ/aSjBqhq3FOnPT+OvAuF
         SfFNtDsFVfXufwrpYqZ58HnHe1RgP4UzZX+LCWgCz+9Rl9HMtlpoEBj1WptssmV0X4
         ZvpPW6A3SZgEhHlK+qp0P4xswq82YbGJdbxHQmcr/Fd2gDMDPCm9k72h+LmcnMpHgC
         C5o3h+NBxJJ+EddKEq7nt871VnHh+KJ/OXMBwBTXlib2Bo6dMBkGt4+4i2VrNjOxB5
         xXCeLYE+9kCxg==
Date:   Thu, 2 Feb 2023 22:28:45 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Subject: Re: [PATCH 11/35 v2] Documentation: i2c: correct spelling
Message-ID: <Y9wrDdgxIfig0oI6@ninjato>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        linux-doc@vger.kernel.org
References: <20230128192109.31127-1-rdunlap@infradead.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="Ry8rmYqXFx5IKjnv"
Content-Disposition: inline
In-Reply-To: <20230128192109.31127-1-rdunlap@infradead.org>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--Ry8rmYqXFx5IKjnv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Jan 28, 2023 at 11:21:09AM -0800, Randy Dunlap wrote:
> Correct spelling problems for Documentation/i2c/ as reported
> by codespell.
>=20
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Wolfram Sang <wsa@kernel.org>
> Cc: linux-i2c@vger.kernel.org
> Cc: Jonathan Corbet <corbet@lwn.net>
> Cc: linux-doc@vger.kernel.org

Applied to for-current, thanks!


--Ry8rmYqXFx5IKjnv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmPcKw0ACgkQFA3kzBSg
KbaJfA/+ISwT2HWCfhlBQFio0akiVzuO/hbI4/POprccdxryZ2zYDb22SUfw6T6Y
n869I0qWY7dIQU4Ckmu3tp9rPk87kicwk0HuVgIdaybmu6wMNlphp7Y2lPgPTYFU
1+LMAwz+yN6/Lkp+oHOuMSYvHpCYkoKE1fLas4Eo4w4DJ23ieeI/sd6YRhpYKrSq
y8//qjo49rBZd/rH1maFYYst3hb2rEJjpQeplkSIgdcRP/TVDGJzc0pfa8CLeB3J
/fm5z9RbvyEEqggKFUKIBmyQzkCa9JFY14XsX9rkxryKqbi/xzJjuaUVNSwMjvTG
6UpGSsPrWARXZCStICABUjnb8P0hxr1lZq9Qc4US8lQSn5EICLQgnDS0WvGENGdD
APLbV44qMrSPlrdsAn9xNyl2V0iSJZYKc/78+dZQoQsQCe9u5xVXv6ALyi2Y9QPi
4DMEMs5vTKjzkv6+U3B3TKoZkrPKjDZuKIUpmqmRfzh5l39bHvas92eToXWDLjC9
A29+gWmLs+mfBm+TPdDR6cK0dOkzeVfZpaSQec50VREh7HZkmvj4Fm7jSOjVaaVX
wo8q5PbOePhWOd5wYRETWd+FceqRUVSxI0O+Zr2VpNCkAJePWsHm4Ru+Tjl2QJtv
xY/AMe5P78QieEfaB+lGCYkOAsndyFNAjpzR9caY18tDjQFM5QM=
=ZLeQ
-----END PGP SIGNATURE-----

--Ry8rmYqXFx5IKjnv--
