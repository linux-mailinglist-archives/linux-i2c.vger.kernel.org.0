Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5298A2619DD
	for <lists+linux-i2c@lfdr.de>; Tue,  8 Sep 2020 20:28:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728442AbgIHS1l (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 8 Sep 2020 14:27:41 -0400
Received: from mail.kernel.org ([198.145.29.99]:56660 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731427AbgIHQK3 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 8 Sep 2020 12:10:29 -0400
Received: from localhost (p5486cc72.dip0.t-ipconnect.de [84.134.204.114])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 2CC5024706;
        Tue,  8 Sep 2020 15:40:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1599579633;
        bh=DSdQRvlhEZrNyoTYUyeP2IfmitZ97N0qX3yY6O/rg4w=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=fKAdTkWgVlZHBsQeqhWbFVwcx3PI4peN3HBqdwkkUnz48Me5pjxQ0ePJaGWz8/+Mm
         1zMxJFjckU9+zpHcEu0ZmNVOzLCHbMvD8NHyVMx4qeJmkUPClT6RhrCKSxPx9YJxYa
         2hazPty35yb5b5W8z7mx6H14wm0CHNUA4hej7xec=
Date:   Tue, 8 Sep 2020 17:40:29 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Jean Delvare <jdelvare@suse.de>
Cc:     Linux I2C <linux-i2c@vger.kernel.org>,
        David Jedynak <sileasresearch@gmail.com>
Subject: Re: [PATCH] i2cset: Fix short writes with mask
Message-ID: <20200908154029.GA1772@ninjato>
References: <20200903110054.52a3a69f@endymion>
 <20200908065111.GA5936@ninjato>
 <20200908171908.65690731@endymion>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="jRHKVT23PllUwdXP"
Content-Disposition: inline
In-Reply-To: <20200908171908.65690731@endymion>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--jRHKVT23PllUwdXP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Jean,

> Funny story, while I only posted this last week, I wrote the fix
> several months ago, so last week I actually got to review my own code
> with fresh eyes, and when I stumbled upon that specific change, first
> thing that came to my mind was "this is a useless change, why did I do
> that ?" Then I scrolled up, checked the other changes in that function,
> noticed the removed "else" and said OK, I'm not that stupid after all
> ;-)

:) Now that there are two of us, maybe this justifies a short comment
explaining it?

Happy hacking,

   Wolfram


--jRHKVT23PllUwdXP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl9XpekACgkQFA3kzBSg
Kbb13w/+I79RKRNfUFz6NzHyFi60uIUZdhCj3imqELsXQ7nYPYWnQAQCEBqSuyTY
Ae3gjUoEDWhjyyZCCgyTY1ikAv78awTmZpj93QnwmQVfyAm773YyGn/M5IztE8cK
GKZaj0vX6JZVK9T//JUcSWXq0SIMlfddZcDxPZAH07Win84r2Qe0KSgk2sdkmljh
ip7rguxgZLf6qItuGLDvyQ73pdsMYw5WsQd3BMpOBVFRQJtzlf0NRBCLTiEBDhMj
7udm8rSjaHx8OYiPVI77kUosiLRIrPJStRQCJ1INw5VHC94KhLZfhhClYY+O7T8b
C2nV1ywZ6SNN94jN/or7zcEU45J3etbcsML3eEcX2lCBMKMe1GmUdnZSDAnvQXYv
F4sZ4NoJVEjdsUaiqe9HDPqF8h1B5t0zYmSL0F7MCpTlp6JAjuB2S8UkMrRbKk0R
M6KM1uuX+3vX1zqop9sre8GtuH7C+HWs44JHebNv6TMY5yM5aLS5I3sfJ7Hp795S
GJIUeweQ5jBggtD44JweHqMrC5v3VgHh8o18m7yE3FqzgZHzRAZb+ubzjC6oBk8z
CyHAY1R2VKyl8OSe4mE0UipzLImSBveHjTmzmMgsxVInf5XAb4BbaVFpJMK0ys28
TH3tE0B89r4dNIjrVkZE1yqe8vfAiteZdM6QPtB66r9w91R8c0o=
=E4xv
-----END PGP SIGNATURE-----

--jRHKVT23PllUwdXP--
