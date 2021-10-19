Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D53DE433477
	for <lists+linux-i2c@lfdr.de>; Tue, 19 Oct 2021 13:15:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235237AbhJSLRc (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 19 Oct 2021 07:17:32 -0400
Received: from mail.kernel.org ([198.145.29.99]:52134 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230168AbhJSLRb (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 19 Oct 2021 07:17:31 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7CC2861057;
        Tue, 19 Oct 2021 11:15:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1634642119;
        bh=0pzfE+m9QAv1D0mEwEASyiRJdsx78gOHISq61r3d6C0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=GQnCQU8TUhpcu+ZcsoviRXWOroZxO2LRt/ev+BcL6fBqG/Rq+agpSu7dt4Qa5kZ2z
         UjtJ5T1zQnGZsxwwZuNLGEga+Q2t90DYQl78q3IqTeoIInPycH2uzbRRIo9CYKL3/2
         2L4mBNqzZLH6skfGI5RJPGsqWLLYpKbuookOpqRSCb2bj8jcybfyUElBhjlvzfbw/l
         uZQJ4h48w3pw1c5osk2lSsS25ExUxOSR7uvgTqucOKG7HqMnlFuk0iR5oY4ybzNos1
         wpIB++NV9K3LbjcZmxHx0QRr/dqWwEUo/hJzG95A5OzB/f0vNvoWjWt15MGwvkbEB2
         eXkTQ6J+V/mlQ==
Date:   Tue, 19 Oct 2021 13:15:12 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Viresh Kumar <viresh.kumar@linaro.org>
Cc:     Greg KH <gregkh@linuxfoundation.org>,
        Vincent Whitchurch <vincent.whitchurch@axis.com>,
        jie.deng@intel.com, virtualization@lists.linux-foundation.org,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel@axis.com
Subject: Re: [PATCH 1/2] i2c: virtio: disable timeout handling
Message-ID: <YW6owLxoYbxG5GxT@ninjato>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        Vincent Whitchurch <vincent.whitchurch@axis.com>,
        jie.deng@intel.com, virtualization@lists.linux-foundation.org,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel@axis.com
References: <20211019074647.19061-1-vincent.whitchurch@axis.com>
 <20211019074647.19061-2-vincent.whitchurch@axis.com>
 <20211019080913.oajrvr2msz5enzvz@vireshk-i7>
 <YW6Rj/T6dWfMf7lU@kroah.com>
 <20211019094203.3kjzch7ipbdv7peg@vireshk-i7>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="r0uogqcx2U86UesD"
Content-Disposition: inline
In-Reply-To: <20211019094203.3kjzch7ipbdv7peg@vireshk-i7>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--r0uogqcx2U86UesD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> The other side is the software that has access to the _Real_ hardware,
> and so we should trust it. So we can have a actually have a completion
> without timeout here, interesting.

So, if the other side gets a timeout talking to the HW, then the timeout
error will be propagated? If so, then we may live with plain
wait_for_completion().


--r0uogqcx2U86UesD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmFuqLwACgkQFA3kzBSg
KbbdAw//e6EIHKI0d9s3p+Dx/ZFB0fAI4BmeUGH0/AIhfRpDrdtXVTsmXE5UXoqP
LwphzSVAc/7lP0n4LWN5pRhTs0NSwW5uZqNMTRXiDsGVq7+B7BXKqFxUWrM9mBGd
+iiRIihFiAXNvd2vjKRH08FxopzQb8yip+yUuINVrwuq97zTF9PiuIo8eOz00L1L
ZHJ97syfXO0RDL1MiXdI6W4Omnp6dtNr2VqCr+Zo+WVcorE0ksvGc9SgkCnsKOIr
pi71UpwDrf0ZxDcTtG+nliYcsKQXJDBBUFJkiUbJfe8HnverTtlftx74Qz18VNkE
vq/CJPOpHd3U7Oaq5ZspBziverdsHSQn884XaZmrAgPDgdP1jj6OVl/Qqkii3P4k
oK8CMfBYOAFqCZpfGXoU0fsee+IdQj+r/8Co0LB+nZUu6CVeOtiub8s4Aecxj0tt
xAk0d3KlPwy7g7H4Tt8GpSmRxe1LNBZaS0ejKa10KpckIvQhO4AwGq+XSPyhtosI
LRLYj3BFMPjqNRJ4EDMgkuAzeTXh7rjSs8vhdaG4mbeU7o7BGYYCQ7lsm9fqL/Ro
/FhW22bGp18LnBjvyzkXCFRKPuyIlfRpyMeoi3vN9nOOWdS0G9WYYvYfSfvxB90x
2/dyJQWRJsodtbZkUM+ImH/BpBLEq88i+BMnKT0EoAQ6g52LCJY=
=2nID
-----END PGP SIGNATURE-----

--r0uogqcx2U86UesD--
