Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 250E32990BE
	for <lists+linux-i2c@lfdr.de>; Mon, 26 Oct 2020 16:14:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1783415AbgJZPN4 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 26 Oct 2020 11:13:56 -0400
Received: from mail.kernel.org ([198.145.29.99]:46954 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1783343AbgJZPN4 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 26 Oct 2020 11:13:56 -0400
Received: from localhost (p54b335fd.dip0.t-ipconnect.de [84.179.53.253])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 735CB2222C;
        Mon, 26 Oct 2020 15:13:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1603725235;
        bh=rdypqWru50mKsVqtG1SbMdaWW5DpSTgT2JsspxBvrBM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=kRIa4GuxF5XYhTsdWuV4S9Z82noyYZpSGBxpZXOcvqkGCaHx1jda7mHC2hV9lT4xH
         5Vo+rCci5gtwT4gXwL700meVOPdh7lsY/tuyZvZQdpOCyh5P0CCAERJ0XY73KX1P5o
         zB6B3esvWd6sLNna5vjEQmJBYAG6Ivy65RBeG1l8=
Date:   Mon, 26 Oct 2020 16:13:51 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Douglas Anderson <dianders@chromium.org>,
        Akash Asthana <akashast@codeaurora.org>,
        linux-i2c@vger.kernel.org,
        Roja Rani Yarubandi <rojay@codeaurora.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        linux-arm-msm@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Mukesh Savaliya <msavaliy@codeaurora.org>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] Revert "i2c: i2c-qcom-geni: Fix DMA transfer race"
Message-ID: <20201026151351.GB1044@ninjato>
References: <20201013212531.428538-1-dianders@chromium.org>
 <20201013142448.v2.2.I7b22281453b8a18ab16ef2bfd4c641fb1cc6a92c@changeid>
 <20201026150500.GA26921@builder.lan>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="EuxKj2iCbKjpUGkD"
Content-Disposition: inline
In-Reply-To: <20201026150500.GA26921@builder.lan>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--EuxKj2iCbKjpUGkD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> Wolfram, would you like to pick this patch or would you prefer that it
> goes together with the other two through the soc tree?

Actually, I prefer the soc tree because of the functional dependency. I
am not aware of any pending qcom-geni patches, yet I think an immutable
branch for me to pull in would be nice in this case. Could you provide
one for me?


--EuxKj2iCbKjpUGkD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl+W56sACgkQFA3kzBSg
Kbag5Q/+MDIQrIrcVr4d8UHc9MsdoSJUNYl64v50xdhP2yxGys+USr2rgJ1gcUCy
R9YR65gJL3m8ogdMDJ+TT35LcIXEtlWWPV+UXDE/LqkicwyuTxLOTqdpCZg1X9Jx
jQmnal61gEdBh+ShT4rQCY7iRFqm4aMkuYXraWk4H7rF008F2lfapB7zL9R0sHXX
t7NXKCQaAw52gxdPJEgisbGHKyUrUVKUXRVBp+TivOJ4MJ8pZhcSjylKWzXeHaxI
k9XTKVGqmqmvke5TVllo+aQeA5NvKzmPLvpVKQwfHTcjTwTqLbT8dSe4m36k/Xjn
2g0mvDb3THcyQHw955OUH8qAuV35I04eHTOFgiKa9JOaEIvoM7K6zcukwPkTNHLi
PGD6uK6bJ5dALt14KnLB4k4w+6Gy9C+tKs6Dz8szhKUZzeniVQ8C0Fl1aSuZky8v
vugl4R//IK44cdTWhy+tZnOKvw2LwiTiSgNuCvVUTc1Y22LGD1r9sU3eP2MB/HAA
thelzmWzhZULTH/HpZNCgRc7BGRYN71f8+v6oyZ391Uj/O9BlvWLreikSxkkMcO1
e70inxFQV4R70epazvqhK9ZFizpMC+Wg1VBZbkxJVU38QMAIXVwgO+C0SkZbVpRk
yARhc/eTgaSxeSMUMm1fT/RXYa8EzU2JR2YY2iOsjvPyS7gWrUA=
=mSR+
-----END PGP SIGNATURE-----

--EuxKj2iCbKjpUGkD--
