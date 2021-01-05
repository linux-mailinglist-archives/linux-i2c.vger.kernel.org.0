Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3C5532EB484
	for <lists+linux-i2c@lfdr.de>; Tue,  5 Jan 2021 21:52:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731379AbhAEUvx (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 5 Jan 2021 15:51:53 -0500
Received: from mail.kernel.org ([198.145.29.99]:53110 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731367AbhAEUvx (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 5 Jan 2021 15:51:53 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id A769022262;
        Tue,  5 Jan 2021 20:50:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1609879824;
        bh=9VOt6YRWo5PlMhQR000IAJMTQb6o1yGHq5eamT/XZsQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=CvuwCYNlPSY/BnoaO4a56xQcVYGwfv5PPRHOIjqdQgNdWSLrSTPnnuQQjxKsQaU7R
         cijxRJHrbfekvWUDkpL/BqaFrkzz6fa9yU4spz+hbBkjhuAc01hUbd/Qq1yOwPB3hx
         O5U1yF++D2JLp+04S8vs0TIrwiXd/MgZzfEAJzvGeYdzsRPkFfUnExmrXWNMuE89uz
         RD4MSQZLyTnqDqCBSJ1KUjm0kUfxY93IqLnBZui5nOWpfLqSbW9KbLWkKE/vOh38Zv
         ktvWjep89zz0s1xQGxBCf2xJIUG5BtWxeAcNfu80QZL/xiYM3VCtdvpDyaqBX3Y0KV
         K8Dwv1WgRlKfw==
Date:   Tue, 5 Jan 2021 21:50:17 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Florian Fainelli <f.fainelli@gmail.com>
Cc:     Rayagonda Kokatanur <rayagonda.kokatanur@broadcom.com>,
        Ray Jui <ray.jui@broadcom.com>,
        Dhananjay Phadke <dphadke@linux.microsoft.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        BCM Kernel Feedback <bcm-kernel-feedback-list@broadcom.com>,
        Brendan Higgins <brendanhiggins@google.com>,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Lori Hikichi <lori.hikichi@broadcom.com>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>
Subject: Re: [PATCH v3 5/6] i2c: iproc: handle master read request
Message-ID: <20210105205017.GA1824@ninjato>
References: <38a23afc-57da-a01f-286c-15f8b3d61705@broadcom.com>
 <1605316659-3422-1-git-send-email-dphadke@linux.microsoft.com>
 <CAHO=5PFzd9KTR93ntUvAX5dqzxqJQpVXEirs5uoXdvcnZ7hL4g@mail.gmail.com>
 <20201202143505.GA874@kunai>
 <23a2f2e8-06ad-c728-98eb-91b164572ba4@broadcom.com>
 <CAHO=5PE=BRADou_Hn8qP3mgWiSwDezPCxDjuqa0v1MxMOJRyHQ@mail.gmail.com>
 <35541129-df37-fa6f-5dae-34eb34a78731@broadcom.com>
 <CAHO=5PFCsWQb7nv5Sg00DAX6XXTfV7V8BH-ithK-Scq8eFFVbA@mail.gmail.com>
 <20210105162145.GG1842@ninjato>
 <b5e38606-6ca8-b52c-65cd-5f24411661d0@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="qMm9M+Fa2AknHoGS"
Content-Disposition: inline
In-Reply-To: <b5e38606-6ca8-b52c-65cd-5f24411661d0@gmail.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--qMm9M+Fa2AknHoGS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> We are working on it, but as you may expect with any large corporations
> it is "complicated".

I understand. Good luck, then!


--qMm9M+Fa2AknHoGS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl/00QUACgkQFA3kzBSg
KbbD5BAAiFecmQS+ZDRmbLaweW+ydzmXk+B01i4MZeiXZLT5PTzaGVAlpUSXMKOQ
Oretk1Dke+1bwJxVRH6WHZlk1AuZyLA/TVMieq7VGXksTQqrn8SNV6H5A57woElb
qw9a+C/cadFLPP71R3Q4o9XkTTIEiwCaeQJXtXcx+4jDSj1IynGphDUl7mw4DaPP
L3+hKGCoP0Bqpjsu7pFw//CR/3z/uQd+rSqhz+sLyD3kyJgCfagnGwivQeN+wINK
xnRd4cfHkTHnd6lCFI2VCI7dvB4bv4keIiifu3bddQyyP8rQb/K9gVw1hCHmxQ7O
+j+TizPriPV4SKcrfYIh85OZSxtFGZz+/E004ozNlqnLyTnW4tpfkkjthZNj4jN1
BOHFVM7DC7iaMeVu347y8SyljbQu5YrSi2t1pXusSh1SCj9XhzzAEUKyeGgcDSwS
5EW+SGFafZKZDDvpmg4s0OT2agdTNyXFKTj3PdLGCxhZG7zTlM50Gw+ANz8ZicJ5
A+37jKTO0cUxSoQA5DkSQOtwnrpOsTi5xsYokTexeW3Wgn3AJVCpQRUFNr6XfMPr
bdR98aQ1KweTHQ+FRTuiB/pz/QiC+rKqFVQbiyc5nWdn445ToQe0gcZ6lYawLsBc
ncMxG34p4zlT0FQo8e5m36wAeb0VqXOSkM2MMTm5r/AHOfxwIo0=
=dsvX
-----END PGP SIGNATURE-----

--qMm9M+Fa2AknHoGS--
