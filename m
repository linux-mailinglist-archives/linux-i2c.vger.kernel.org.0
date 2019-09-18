Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0D68DB6F16
	for <lists+linux-i2c@lfdr.de>; Wed, 18 Sep 2019 23:55:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388190AbfIRVz2 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 18 Sep 2019 17:55:28 -0400
Received: from heliosphere.sirena.org.uk ([172.104.155.198]:43460 "EHLO
        heliosphere.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732151AbfIRVz2 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 18 Sep 2019 17:55:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=nnfFIiNieLihG356kpTXZHoPISeQ6pVKSGXwBlR03Wg=; b=fHD0IoldyloezyuQIE3+33mgz
        a2FRf6PtQPtxgzqevoFWU+haWqndcceRfaeFhzd/7nhQTa0krkKiyT8+9Y/PwE0iseXRu6lt8NJ6W
        1NDc084MrgSL9rvNCpmRd0+y4/Af7pNYWv0Su+rgqUU9h0OCUfdZ4P0Z6UBHAAOJOu4Pc=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net ([82.37.168.47] helo=ypsilon.sirena.org.uk)
        by heliosphere.sirena.org.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <broonie@sirena.co.uk>)
        id 1iAhv2-0007ch-4U; Wed, 18 Sep 2019 21:55:24 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
        id 302E72742927; Wed, 18 Sep 2019 22:55:23 +0100 (BST)
Date:   Wed, 18 Sep 2019 22:55:23 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Greg KH <gregkh@linuxfoundation.org>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-i2c@vger.kernel.org,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the driver-core tree
Message-ID: <20190918215522.GU2596@sirena.co.uk>
References: <20190918170952.GT2596@sirena.co.uk>
 <20190918185257.GC1933777@kroah.com>
 <CAHk-=whreYmsU_AQtzDS5gd3yamYJ72gBo+YekYSyJLPQ1Qo-A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="rfwNdt5cNUUjB/69"
Content-Disposition: inline
In-Reply-To: <CAHk-=whreYmsU_AQtzDS5gd3yamYJ72gBo+YekYSyJLPQ1Qo-A@mail.gmail.com>
X-Cookie: The devil finds work for idle glands.
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--rfwNdt5cNUUjB/69
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Sep 18, 2019 at 12:03:17PM -0700, Linus Torvalds wrote:
> On Wed, Sep 18, 2019 at 11:53 AM Greg KH <gregkh@linuxfoundation.org> wrote:
> > On Wed, Sep 18, 2019 at 06:09:52PM +0100, Mark Brown wrote:

> > > After merging the driver-core tree, today's linux-next build
> > > for arm64 allmodconfig failed like this:

> > Wait, I thought Linus said this fixup was now resolved.  What went
> > wrong?

> I think this is purely a linux-next build failure.

> I do full allmodconfig builds between each merge I do, and what
> happened is that as part of the LED merge, I removed the
> no-longer-used 'i2c_acpi_find_match_adapter()' to resolve that build
> warning.

> Then linux-next presumably merged my tree with the driver-core tree,
> and that re-instated the use of i2c_acpi_find_match_adapter() - which
> was now gone.

> But when *I* merged the driver-core tree, I did the merge fixup
> correctly to actually re-instate not only the use, but also re-instate
> the removed function that now had a use again.

Yes, that's exactly what happened - it's purely an issue when Greg's
tree is merged automatically, I was reporting the same thing you fixed
up.  If the initial build of your tree had been broken I'd have been
complaining much more loudy and much earlier!

> > Linus, should I submit a fix for this?

> My tree should be fine, and I really think this is just a temporary
> linux-next effect from the above. I think linux-next only handled the
> actual syntactic conflicts, not the semantic conflict of "function had
> been removed to avoid build error from previous merge, and needed to
> be brought back"

Right, git just sees the code moving about and got confused.  Since
you've merged both trees now tomorrow's -next won't do anything for
driver-core and the automation will handle everything fine.

--rfwNdt5cNUUjB/69
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl2Cp8oACgkQJNaLcl1U
h9CQaQf7Be6CUCkBLIU+XgGxIxBpFAKQ3/Lj7v4elTs1RQzhubAGFZLNi0Gmj6jL
9qUFgUH7iPpweMkXP2SdsHWipAa04WYfhyLrNXtWa3NBnn6ZK3N2kEO10NFdH/eo
XiPHkN2gm6gbuP7RWb3379fqCKa6QMPwYU3i5hn5+DYhYd6uxqtZhjBl3IcIgBUt
yd/B6f7fn33tPTVvid8AEeERj7z1M3R8NKqGNX8Nor8m5xR+ANm8kDMR926waYqp
XyLgCdf/Sm2jPJhCa1xKkxGJCirYLq/1rvDfxA3+MtBsf3sqcOfvvCdeQqaZpJDd
dp2CveS+YlO4vxhcok9dt/IzaTkbSQ==
=TZl6
-----END PGP SIGNATURE-----

--rfwNdt5cNUUjB/69--
