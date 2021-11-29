Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 23C88462246
	for <lists+linux-i2c@lfdr.de>; Mon, 29 Nov 2021 21:34:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233152AbhK2UiB (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 29 Nov 2021 15:38:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33680 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232388AbhK2UgB (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 29 Nov 2021 15:36:01 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB8E6C08EB52
        for <linux-i2c@vger.kernel.org>; Mon, 29 Nov 2021 09:10:03 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 7F29FB81261
        for <linux-i2c@vger.kernel.org>; Mon, 29 Nov 2021 17:10:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1971C53FAD;
        Mon, 29 Nov 2021 17:10:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1638205801;
        bh=4bS07e8gSW0fzxfov2nAwWrVbwc0hGwfKPrp9/F+D28=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=jUS5SUjIqcrZUwRDemw/GqNK/qzEd4ERyfN7aW0SqwOVXvOB/kckgxhnKI824y9Xz
         MOdA0uTaRaMVo+hm+lG9rJJYvYh5z1+1itLGvfR2KefufEWneWK5HyB6rlR/Knxpih
         VbsoQByoRksLE8Fs6JCYiZ4RCT18+ImbgxWB7XYnvUgxh5DMEcE+87KBLF5FMvXjho
         gFGxknNYdVMosD+gNWrRxElXrtkEyb6UVc3zlp1Qs9IukKvgEzfa5QrrEWP385n9Tv
         j0dCnVqM6rhW6LLVeXeWn2c9DLvhnM+vB2As9K57syelkDNSim/hQPI+rfj2mxk0xq
         3wm5j+IbflFSg==
Date:   Mon, 29 Nov 2021 18:09:58 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Sui Chen <suichen@google.com>
Cc:     linux-i2c@vger.kernel.org
Subject: Re: [RFC Patch 0/2] I2C statistics as sysfs attributes
Message-ID: <YaUJZn0aLf7GknY9@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Sui Chen <suichen@google.com>, linux-i2c@vger.kernel.org
References: <CAJOps0s4qY3O36BGUpffzzA=gxw_crDzf_iif2fq0RdVhfCydg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="befE5sYyLMVpU4pD"
Content-Disposition: inline
In-Reply-To: <CAJOps0s4qY3O36BGUpffzzA=gxw_crDzf_iif2fq0RdVhfCydg@mail.gmail.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--befE5sYyLMVpU4pD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Sui Chen,

> It appears bus errors and NACK counts are frequently found in many
> I2C controllers; a few I2C bus drivers now export those counters to
> debugfs. There is some effort in attempting to monitor a large
> number of BMCs (board management controllers) and we are wondering if
> it is possible to have a more stable and unified interface for those
> counters to be exported to compared to the debugfs, so that a single
> command can be used to obtain the counters from different types of I2C
> controllers.

There are at least two things to consider here:

1) Why do you need this information? I don't think values like NACK
count describe the health of a system. NACKs are perfectly OK in regular
I2C communication. So, for now, I think debugfs is the better place.
An exception might be the bus speed. Some people already had an interest
in this.

2) Even when this information is kept in debugfs, we can still add some
core helper to have a standardized structure for the created files. This
is independent from sysfs. I don't think I want this a standardized ABI,
currently. Unless you explain good reasons to me :)

Thanks and happy hacking,

   Wolfram


--befE5sYyLMVpU4pD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmGlCWIACgkQFA3kzBSg
KbYh9A//fzE1WzmhwzTu6KhijDC8bErZxcMkQLw5Ygsdtx7LXH+2fhxkF403vCQu
fqTYuYvJBQ0SevY66WCKay9F5aU6gh/1eBvsFUwD3kgMTtZCpXfucbs7Qxwxnm+N
LtW8ex163qwrxOIuAaFSa5/Izpc6LgG4A/Dnsgj5ljCxTPFyZac0q/QaVkm3al5A
J5SZGMT3Pi/FjnfoQap66di0RyqVSkig6TikY+H5Zb0wOQUDctXgWNDjqwJ4CMyL
zuZr4u1bYmiLw2w7l+zSfXkHkXJUHJscUX0S7oxKjeLVw1uSfY18ipclaHIMkXgw
ru7CoOPLBFmGoq4JBDHuK70yjrCnwq29LCN61coOAKWkjLF+b/D2+rDTc7U9/Ftm
bI1pkSaWppC89CtzQtmm9vgWtVMuMttGrtFt8UCSXaoG+ao9ht0/tUobcuRqCxL5
W9LdDRgeIi6gxPTv9ekTfUQp73k/eFQuaS6a8ZMix+hAxFmZipD4XblurauYyzA5
j7E/4jLIXX2+6QlDF6s2+tBb3PEc250Sr2x8/FvR7qLPDnCmQgmC7xwdWGX+9Wd7
LSUdZkoDslvRSernaesZY/mVaF8JoGhDWkYyIPuQZlJ1eRjAQlyFIfgj3Anyj1mq
MNeIu44irPaNOzQPwrIP9GtiGxOsaCJzV/svSUJfwxN8Re3D+1o=
=2E/k
-----END PGP SIGNATURE-----

--befE5sYyLMVpU4pD--
