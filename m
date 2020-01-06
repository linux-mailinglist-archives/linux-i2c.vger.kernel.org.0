Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D3280131312
	for <lists+linux-i2c@lfdr.de>; Mon,  6 Jan 2020 14:39:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726340AbgAFNj3 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 6 Jan 2020 08:39:29 -0500
Received: from sauhun.de ([88.99.104.3]:38836 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726292AbgAFNj3 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 6 Jan 2020 08:39:29 -0500
Received: from localhost (p54B338AC.dip0.t-ipconnect.de [84.179.56.172])
        by pokefinder.org (Postfix) with ESMTPSA id 7CB782C0686;
        Mon,  6 Jan 2020 14:39:27 +0100 (CET)
Date:   Mon, 6 Jan 2020 14:39:27 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Russell King - ARM Linux admin <linux@armlinux.org.uk>
Cc:     linux-i2c@vger.kernel.org
Subject: Re: [PATCH 00/12] i2c-pxa cleanups
Message-ID: <20200106133927.GC1290@ninjato>
References: <20191215160444.GB25745@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="SO98HVl1bnMOfKZd"
Content-Disposition: inline
In-Reply-To: <20191215160444.GB25745@shell.armlinux.org.uk>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--SO98HVl1bnMOfKZd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Russell,

> All in all, these changes should have (and have had so far) no
> observable impact on the driver; therefore, I do not see any reason
> to backport any of these changes to stable trees.

Thanks for the detailed explanations. The series looks good to me. There
are some checkpatch reports about using "BIT()" and multiline comment
style, but I am not pedantic about these. Especially since the overall
readabililty of the driver definately gets improved.

Where Murphy's Law kicks in, though, is that after 2 years of silence,
we had a change in the pxa driver applied in Nov 2019. So, this series
doesn't apply on my for-next. Checking against v5.4, the merge conflicts
do not look super hard, but also not trivial, so I'd like to ask you if
you can rebase the series to v5.5-rc1 or later? I'd rather see this done
by someone who has more indepth experience with the driver and HW to
test.

Thanks,

   Wolfram


--SO98HVl1bnMOfKZd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl4TOIsACgkQFA3kzBSg
KbZWDw/+IzmUQSAZaWxkrT2+VyYvcTsjgBTma5q6Azn+BcvhV9skA1ygF2uP85mc
XIPag2SIL5HIeqPbt3RmqkMV3g6CsB1RUTg3iXCfqb1modDAcTm8BTyE9wJLYDQI
qaQfSMJ7/nTx/C7IRN8rLvm+SvZjkHElzTP8fNl/gKMii+WN9Z0kBZ99uoCyKDP7
LZ0M4n3HDhE21yAaBjQNNpdA/hwjblel72K5Q8ztuL+paj8KuqT59ifCBZrvOU69
MilgaoQq0d/nsgHcOOzbEoLRwAAT5gQweOydLE7mV9MkZvNllBv9inBmcE42EvPh
FOQSq7WdZMKjz7QZMOy1EhTmDDU//RTykw/A7J9XpQdPHl3d5psyLozYaUokF+Jr
aUW7YhCkfkzg9QgzRYjnNgzXlNjhog7Ud3P0nH/cfW9N8z/K3IClA/GUVg+5kSSW
JQBB/mFQshhWps9dHuzFEgxsK5ybw4GoReEpj7c+6bQp5/7jYC2r74XnD1C3CFGR
QAui8OOWrhHkHcbNG1LOfVgv2vPO2/n8wbhRBjnJNOT7Kt1f9bJwoE8Fe290t/Xl
/JoWjS9sWIjfLWEboHAbMbrQlTLmeJLEpG+Gz1M6/WW+KIoWAIEXTXIsQXtELeAP
yfZ2nCx6pSBP2h2yZngsN3LiwWtiQXgYxwYOdWLy/6KnEZwRvt4=
=qvz3
-----END PGP SIGNATURE-----

--SO98HVl1bnMOfKZd--
