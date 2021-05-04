Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 832ED37310F
	for <lists+linux-i2c@lfdr.de>; Tue,  4 May 2021 21:53:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232487AbhEDTys (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 4 May 2021 15:54:48 -0400
Received: from mail.kernel.org ([198.145.29.99]:60032 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232209AbhEDTys (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 4 May 2021 15:54:48 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 27CF4611CB;
        Tue,  4 May 2021 19:53:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1620158032;
        bh=0r/j8p/v0WMfwl7qORsmq6s2OTxkG5aV8XkOqLqw72Y=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ZDO27gy4lnDgiHSPEYDc8pkPgY7LqE9sm34xJn7XG1luMHes+6XjCwdLbhnJxJoih
         xidjKRzDFx6FzlTmAxcfvcDPPcebe5KOyTg4kmdifo6+FJ2WTeEhbctDgHJ6LWdXU8
         TxkHd//qRzJvwE4yNyXiuFWves3HyPOfzTCmBeNlkT7IJ/F67tuQ0FaLWvzxxLCjT7
         KVzSrXEKErcuPzODm6zmeuZdIYisFLR7jr5FwH/XmqMjg1OZkVJY94tx2LqFfH4wEE
         uc+edw9HeUsckvPz+w66qKjyH50SXlcLSKMNDvD9ah09Z62ePeew4M9oaNp6jE2K5J
         lI+m4RWho/nQA==
Date:   Tue, 4 May 2021 21:53:48 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Alain Volmat <alain.volmat@foss.st.com>
Cc:     robh+dt@kernel.org, mark.rutland@arm.com,
        pierre-yves.mordret@foss.st.com, mcoquelin.stm32@gmail.com,
        alexandre.torgue@foss.st.com, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        fabrice.gasnier@foss.st.com
Subject: Re: [PATCH v3 1/2] dt-bindings: i2c: stm32f7: add st,smbus-alert
 binding for SMBus Alert
Message-ID: <20210504195348.GB1783@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Alain Volmat <alain.volmat@foss.st.com>, robh+dt@kernel.org,
        mark.rutland@arm.com, pierre-yves.mordret@foss.st.com,
        mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        fabrice.gasnier@foss.st.com
References: <1616998145-28278-1-git-send-email-alain.volmat@foss.st.com>
 <1616998145-28278-2-git-send-email-alain.volmat@foss.st.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="jho1yZJdad60DJr+"
Content-Disposition: inline
In-Reply-To: <1616998145-28278-2-git-send-email-alain.volmat@foss.st.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--jho1yZJdad60DJr+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> +        st,smbus-alert:

After reading the specs again, I think we can make this a generic
binding. SMBusAlert is optional. So, we can say it is not covered by the
"smbus" binding and needs a seperate one. Makes sense?


--jho1yZJdad60DJr+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmCRpkwACgkQFA3kzBSg
Kba/8g//fDwD9sm7N+HAiL7vPmZr0Uock8CYReRf6YpDV+9Yrhh7MVqURaDwtor8
sIXzxCIeW+HfNXOVjWgEEYwW+NIhjqerMTl+1bG5SLJq+R0gvlsEo7IIAoZ9TdYh
Urt2LEYuR5yXwD38zkpG110NeqvzgMbYnXk7l8t8+FOCLYfhR3FH1VVM5c5/rPy1
P5IY/V+z6Kq+YzMpxUreBg/erR14SxUfy3it1cSSJn2TpiSiUuHooV15orA3+VLR
2VpQLmVBpN86UFHLEHpgSwIYTiOvDu0tF86eZQPCUo3l3blCuId/RhX5ysroAA1s
R/QwP787hLZHrCbvwfFPFMWi9/Yety6/BLWVDHpp22eR9kHtBhQ1tVvn/Fhy+qaz
UZnLlVDMqi6N7tQoKDNYF8tzpz7kyhXMCLT4ZoSlxiFIkCACmYZs+Q8+5CSJKo7A
yuRoVgvy0XG4mTmqDQNda6l2p+SQyQxTri9gSEGczKS6nO8vv/Gb+WZfTyuXe7dW
SPsckWowrvq7Mq0Ea51YqvdRDN3YpvSUEGeBc0hIgOsqRgpsdBAflM97PLV1BktQ
6Ee4/xaVDhrjplvpqVwXJZdslRMQO9iawelqngz0P4xVnMJxNzM73ZHOWIM8AP4S
SreuL3RNm/pPROdtld4xb66OK/mm/cHxgvjy3cLhtbtLrVt/zrk=
=W6P4
-----END PGP SIGNATURE-----

--jho1yZJdad60DJr+--
