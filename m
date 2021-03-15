Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2CB0333C7DC
	for <lists+linux-i2c@lfdr.de>; Mon, 15 Mar 2021 21:40:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229639AbhCOUj5 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 15 Mar 2021 16:39:57 -0400
Received: from mail.kernel.org ([198.145.29.99]:50026 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231810AbhCOUjq (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 15 Mar 2021 16:39:46 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9B11D64F0C;
        Mon, 15 Mar 2021 20:39:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1615840786;
        bh=SZ3F3AFJX1x7pqSBNni70EGhh5YXsrG5NRyZMTIi2ho=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=rnvhOLJQlPA710KvQu8XxVyfb1TrLK/+gysxLhmJJgXwMKXCH95wW1rsGFuW6Z4S6
         +LbExcV/fa2Vg4LV8SSb0u6VjTHJl7ohs3Xup4MkzQwssSjxEsiH0KmjMr+uF1qGRN
         n85IB+st9i+AfnWIXjGqchJhoB8K2xBhpVGMiybzAAIGB9EO9HhGeDzQU+lcugpKJM
         TnznUJ3h4Tj4dKIA3LE2xmV7PJFXAjNprRJywsEaOiR5Ty/F1mCQ3QY4HwJU7KC804
         idCU4bypht4E8QUtwbzKv5Rm4ZKEgJUFFFeVTn1nKciFus5uLmKVTZAmK63D24cUEd
         R9RG7LN/YiOnw==
Date:   Mon, 15 Mar 2021 21:39:43 +0100
From:   "wsa@kernel.org" <wsa@kernel.org>
To:     Mark Tomlinson <Mark.Tomlinson@alliedtelesis.co.nz>
Cc:     "klaus.kudielka@gmail.com" <klaus.kudielka@gmail.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Subject: Re: Linux 5.11: i2c: Confusing error message
Message-ID: <20210315203943.GA4618@kunai>
Mail-Followup-To: "wsa@kernel.org" <wsa@kernel.org>,
        Mark Tomlinson <Mark.Tomlinson@alliedtelesis.co.nz>,
        "klaus.kudielka@gmail.com" <klaus.kudielka@gmail.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
References: <1787a9ee-efae-7e4b-9e6f-d4bf532c6b63@gmail.com>
 <66fb30d6595ea18f60acf36e6b034e63ec7aac19.camel@alliedtelesis.co.nz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="tKW2IUtsqtDRztdT"
Content-Disposition: inline
In-Reply-To: <66fb30d6595ea18f60acf36e6b034e63ec7aac19.camel@alliedtelesis.co.nz>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--tKW2IUtsqtDRztdT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> I admit that I added a "gpio" state to pinctrl for our board, so didn't
> see this error message. I think the easiest fix for this is to check that
> the gpio pinctrl state exists. e.g. something like:

It affects all drivers, so it should be fixed in the core. See:

http://patchwork.ozlabs.org/project/linux-i2c/patch/20210315115008.19110-1-=
wsa+renesas@sang-engineering.com/

=66rom today.


--tKW2IUtsqtDRztdT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmBPxgsACgkQFA3kzBSg
KbY/eBAAiwHDdMrQ8Kw1R+lj9im9K5XWdTud7NXZlkIIKghAbjcZRtSjQ9xzjAg5
vqEUpJQYIhFn43AIiGc6SIWB7M7jftiLYx5LDgw66F5ZWzygUT8fPUO/6asx2C/0
yzE/4Y07Lci2KTD4/g/0l5v8zkZPDrURHcdTg6TMiB40NNHVFRB9YBs/vj68o9Aq
AzMZ33P3r303vwGf+CxIjuT5Vy5jcHYM2EZ7I+7k2tBKd4W5T7ncYswSHfrzClpD
qGt1zQeFOYf0FqVg641XgZcQ7/ZUrUHGpty1tGUjhhe5yBgcy8oV/8bYWOTJowsR
lb1GvjhQCcbNhPjQuAY47aS7XrfB8dyR0NEsQCXRpE/PQSDsnefAnXzf9e69Mg92
Z2EmLGZ3XWuCvy3+u8FvhTgD4iL3z7q0SEhi8bTrMFDZKd6pM+ZHOm1aS6vtYSO0
D5sc/D/lcLcS7TCrMhmFPUApkZk3W05azdK9qvVNP9WDUwEnvYpYph78sgZzBina
NTeezgH366gDHaNsZEtDUunQqxylSq5Fybq0sdco+hRTCaXyFvXuR58ddhZaxb6y
T+w9CLJGgLpqrFMJqa7hzLCrNLAYDocQPOWXNTQbPe5BdytF35OhIHETQAsKvDfD
Hqeu8fel792LMPPHmspLsChjm9La5LbXiAx1UD85NMzrHKTbuzk=
=eFmz
-----END PGP SIGNATURE-----

--tKW2IUtsqtDRztdT--
