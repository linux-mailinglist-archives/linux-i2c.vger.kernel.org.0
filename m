Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1257745D4C6
	for <lists+linux-i2c@lfdr.de>; Thu, 25 Nov 2021 07:26:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347237AbhKYG3g (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 25 Nov 2021 01:29:36 -0500
Received: from mail.kernel.org ([198.145.29.99]:43402 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1349176AbhKYG1g (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 25 Nov 2021 01:27:36 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9083A6101D;
        Thu, 25 Nov 2021 06:24:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1637821465;
        bh=OUHkcVCFse0J7BEGfxwpXVHQjULRa183gmW3DhVOVzg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Qn3yd5IQcUBLumra6MbcJFAIPOf8OqDjI7qIqwFxsid5jZBOcCxk5F+IQj3B6Ip7z
         QqhFHXr9jWHgKknJEuwegAgx44CXOCnQNzFCSQTcPHE7SV2P86AfD8Uqq92MmrNLh9
         jqDl+7itHkONUcDsPqxhfgiFA6muvz7Ll91LcWXrb7hDbaXgPPRLMxgKG10Hb9Gdt+
         MxevFkBBZa5+AvMtp9SiwttBJdng7t+x+tokhxC7IZLhmuU6tJTF/v7T//VZRlViYM
         ihLI372pzxcZh6asaA0aHE45mhBjBpdyktuCn3iAnmnvz6uZIlGkKVjjwVg7K7AmdK
         MaqvU0RJQWgWw==
Date:   Thu, 25 Nov 2021 07:24:18 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Viresh Kumar <viresh.kumar@linaro.org>
Cc:     "Michael S. Tsirkin" <mst@redhat.com>,
        Vincent Whitchurch <vincent.whitchurch@axis.com>,
        jie.deng@intel.com, conghui.chen@intel.com,
        virtualization@lists.linux-foundation.org,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel@axis.com
Subject: Re: [PATCH v2 0/2] virtio-i2c: Fix buffer handling
Message-ID: <YZ8rxHDPo68AT4HN@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Vincent Whitchurch <vincent.whitchurch@axis.com>,
        jie.deng@intel.com, conghui.chen@intel.com,
        virtualization@lists.linux-foundation.org,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel@axis.com
References: <20211111160412.11980-1-vincent.whitchurch@axis.com>
 <20211124185546-mutt-send-email-mst@kernel.org>
 <20211125032119.vklsh4yymwnalh5b@vireshk-i7>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="R0vFRG15XN++6TWT"
Content-Disposition: inline
In-Reply-To: <20211125032119.vklsh4yymwnalh5b@vireshk-i7>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--R0vFRG15XN++6TWT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> Wolfram, you can apply that one as well, it looks okay.

Is it? I read that the code only waits for the last request while
Michael suggested to wait for all of them? And he did not ack patch 2
while he acked patch 1. Did I misunderstand?


--R0vFRG15XN++6TWT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmGfLBIACgkQFA3kzBSg
KbZ4PRAAg742+Rz0NTcNl5M51/MewIuKQoW0EhUsi6vJhGVULs2sAwCC8BrR19nn
H13DA9pH3GYssOkLmb5XZqVQDwmi1znUniEnwfLnKapLXfy9hV+AW/lf4TemvHN3
AVlzt/85QSxLsMHRCGin0tXw4v5+QOxSU0T6ZU2F78o79Ogh0PL0rGgevF+cGmRs
BwIf4aNNUIDKtei8OIQKT6HQmBjWitdcWXEeRWZg6BdJCYlJsmxr9CfXHM1VMwm+
hyGlHkngr60gtf9D5ZRaM6vSccSixzb66HdEqJP4GzCF9BykJMEXp6AXdN3xIVd9
Zg7Y7X0EMvxVpc02185sfwlIAQew9hgNTsmMi3Lpj7rcIT3J2mkJ8rJG7zA9XUhy
eeQJUUBd1PFRQhev8JbdB4xAAxWFiMJhrKGHXaJez8SX/BDRPcBC7Iu85sZSQfc9
tyQtNW+gG7NxTScIYVU0JNDDCp/ehMZ6QxDnoewRwOrgPHWPZ5tBDBScXIueZcVj
SFtBsJmgITMDbTjDBwM/IeI/TWhKlUv7x+plHw1+LblSiEvkHLjNiToSxBfyx7vD
ZrWxEeZlA3VkDGe1IqmHsA6VUVSwY+d4lRF+wW8pIWfy0nmmTRA4h23LsvCXjQzT
LNSqLdQhTv4Vgr1OYVpEMC13V88/LifcMth8ZLEHxt0FuoDNaVs=
=2AXP
-----END PGP SIGNATURE-----

--R0vFRG15XN++6TWT--
