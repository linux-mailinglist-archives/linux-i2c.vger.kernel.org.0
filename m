Return-Path: <linux-i2c+bounces-10195-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E0681A7F103
	for <lists+linux-i2c@lfdr.de>; Tue,  8 Apr 2025 01:32:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B56921771DB
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Apr 2025 23:32:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A5FC229B0E;
	Mon,  7 Apr 2025 23:32:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SQlCAGo8"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8909E224AE0;
	Mon,  7 Apr 2025 23:32:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744068772; cv=none; b=hd2znkZPh/RVtzrfyepjixqEIHFV5T2sNBLmC9gAgx1olFU5U1u+OezFTTVhUl1IQHQ0UoxAoFCIZpd6n7U7PQXhjIAZ6RMHH131LHEnFTSMVTDxwfkT0j6ZY+soZGLX1zvHijqRhAwscXhy8zL4g5Y1/2TuQNt6tjvsAWfxOWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744068772; c=relaxed/simple;
	bh=dmuKXMQ/caR//xPi4FKmohokbL649GqU+5X3flfmL4o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u6k2WYw8w6YnRgA/LJmDouL8yPw48D92ceZ7X7mK0wGjpIEdDc01B6n0ue1X76O8WvC/TiWvgs5SPVPg7QqP1qxnyddkzyeTOCnsgaTzOaixipyCSD5VKj4b9gP2HZb80e/obSNJCvZ9V1yTxmLlnKIM6LNFhJMfsCFIdkcWpNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SQlCAGo8; arc=none smtp.client-ip=209.85.219.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-6ecfbf1c7cbso86452536d6.2;
        Mon, 07 Apr 2025 16:32:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744068769; x=1744673569; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gce3tpEJQvbseQHEqMDIeqXwjb5hnF6K+vDTyD8uXCg=;
        b=SQlCAGo8LcOUKY0fONwRaspEU+tiipbXEP+a4s2JR6MuYt0DgfDa1Ns4ml96ubrE/G
         JzqOA+vrJbSd8qStlO4v+1y4mvpyaujhEyMxAVksFbliT4rW3DitKjehGz3t86buH826
         p6ek6mUH49KKrU+QLOd6su/hziExA/kFlPhPJczIFWAlTwGGw5VE+8+K9M6Ym8ZcPvCQ
         54jdrfsW0vGHAmIP7IZ/aBfVWST/GwmU2ec/2v3gY1XTaiBuS4KwB+l3d0FkaqdmlNXJ
         2oiqXDri9BfyyInVUfM7rMC/TbDfXXc/sY9EXhnwyXzjy26g8EEpzPO9zn0jYIP+eC+p
         MS6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744068769; x=1744673569;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gce3tpEJQvbseQHEqMDIeqXwjb5hnF6K+vDTyD8uXCg=;
        b=vgwf+QzXFu3Py9sRa8Q/J2Cfkgbap9Fq5QbgDxXtPFNxT20GabFwkUo+DoweSwzblD
         UmhuHZl0FIj205yIyp1RKtfV/IuNRql1IxWUMvoG+zX1zxE2mQ9iClEDP83/N2UASQkT
         L5ZsXkS9DPTLsEj/QIcO9pm1Ny9AUlYrv1r0BSPP3CeOEbNooZ+Q6VTA09S4dUdrWQjD
         R+ws0H01JSvsYxh0pCh0u+iI4mkdp9sTbfl1AKxUMnzm+wZsVZ2Kitu80ojmTbHvdraE
         VtE6nAe614K79GxkmCOEOgmIp/E4w4VGafRNKAoI8VrekTXDbc28Kt//qoab4/twTuOs
         sWgg==
X-Forwarded-Encrypted: i=1; AJvYcCWWcf0C/JO5YgmU7ALWaqj8gtWrGwnzD1NOsHWiJtRco0hwWe0FdIQ3kRuyw/9pCk9yoktg0vN9GfPspXI=@vger.kernel.org, AJvYcCWdhaEPZEajMRNe08br8/DY/tjnErdWsqGxamAYuUFhK8GoUhBcD5sK3KFfPjguuwUS84wA/h8RWPcuvKUg@vger.kernel.org, AJvYcCWkYEe3XblN2C8/tF9nFx5t1bKkZDV2aMFsxwgdV8SWQFRZb8AkhefPLPeaUHrspzKs0INS1HNatTHK@vger.kernel.org, AJvYcCWuUToW41Al28EfZQSP6D5ij/+uLIaAaTEYIQdQebPerET6x3CqMk76n69oRkOGHpAcPDvMgmSqJilm@vger.kernel.org, AJvYcCWxnUWtAsh5RQETYIrQ7lzzpcgGyBXr6oQzZ97LisFik3zGVwU805UOfHnfATecAfdthYLbvJrUMWLo@vger.kernel.org
X-Gm-Message-State: AOJu0YzJNh1TSuA8hGZ+scZi3tMeRb3ysEyrYRy+gF4yJSN2SdLUJZRz
	EfKMxMtAj1RrCjX3myAkYYkDTYjuhPEkakURLm0A8iN6la53ls6n
X-Gm-Gg: ASbGnctcxlFSxcWLUnusiTuMtRfaHhyAx+lrS6JLfjtUM6vUKXM+k0efQid0IbLdq3n
	2aqRnWCiHgvpWvShMMtWC+GjthANJ9fKPWphqtCaDrfWy49ytaYzi2DwSf/A46mNs875nwkPRoa
	hrSr0oepIp3WTT8fdhaqBE541c9SqFplPWUeWumWhfUCYZ/opSpebcfrZD+a3JOmcjGsPthrp8C
	zMkzlmDRY+6p74yCJgp90Vi6/JUm4OQTNAqP5MJGTAKJeEVNS8rkBWLlhtomtqC/+m6hB49XHd2
	D12xBSlTYz4ZnHco0XeA
X-Google-Smtp-Source: AGHT+IGGFoQKhq8jM/xnT/qx+VBX8ceaYU/gWDZkhtX4DqhWCeEET7bOo/0E0kCVyVbHnelemU4pwA==
X-Received: by 2002:a05:6214:493:b0:6e8:9021:9090 with SMTP id 6a1803df08f44-6f00df2bf58mr216384456d6.26.1744068769391;
        Mon, 07 Apr 2025 16:32:49 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id 6a1803df08f44-6ef0f164dc6sm65186516d6.120.2025.04.07.16.32.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 16:32:49 -0700 (PDT)
Date: Tue, 8 Apr 2025 07:32:14 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Rob Herring <robh@kernel.org>, Inochi Amaoto <inochiama@gmail.com>
Cc: Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen Wang <unicorn_wang@outlook.com>, Andi Shyti <andi.shyti@kernel.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Samuel Holland <samuel.holland@sifive.com>, Ulf Hansson <ulf.hansson@linaro.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Bonnefille <thomas.bonnefille@bootlin.com>, 
	ghost <2990955050@qq.com>, Jarkko Nikula <jarkko.nikula@linux.intel.com>, 
	Jisheng Zhang <jszhang@kernel.org>, Chao Wei <chao.wei@sophgo.com>, linux-hwmon@vger.kernel.org, 
	devicetree@vger.kernel.org, sophgo@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-i2c@vger.kernel.org, linux-riscv@lists.infradead.org, linux-mmc@vger.kernel.org, 
	Yixun Lan <dlan@gentoo.org>, Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH 6/9] dt-bindings: mmc: sdhci-of-dwcmhsc: Add Sophgo
 SG2044 support
Message-ID: <7wklz2qbo3pej7plhdwcuwilbkntfiyuadjpihuhedkvhgvz6p@3h2hxhw54lgq>
References: <20250407010616.749833-1-inochiama@gmail.com>
 <20250407010616.749833-7-inochiama@gmail.com>
 <20250407140015.GA2164748-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250407140015.GA2164748-robh@kernel.org>

On Mon, Apr 07, 2025 at 09:00:15AM -0500, Rob Herring wrote:
> On Mon, Apr 07, 2025 at 09:06:11AM +0800, Inochi Amaoto wrote:
> > The sdhci IP of SG2044 is similar to it of SG2042. They
> > share the same clock and controller configuration.
> > 
> > Add compatible string for SG2044.
> > 
> > Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> > ---
> >  .../devicetree/bindings/mmc/snps,dwcmshc-sdhci.yaml        | 7 ++++++-
> >  1 file changed, 6 insertions(+), 1 deletion(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/mmc/snps,dwcmshc-sdhci.yaml b/Documentation/devicetree/bindings/mmc/snps,dwcmshc-sdhci.yaml
> > index e6e604072d3c..47b5fc1b8e07 100644
> > --- a/Documentation/devicetree/bindings/mmc/snps,dwcmshc-sdhci.yaml
> > +++ b/Documentation/devicetree/bindings/mmc/snps,dwcmshc-sdhci.yaml
> > @@ -19,6 +19,9 @@ properties:
> >                - rockchip,rk3562-dwcmshc
> >                - rockchip,rk3576-dwcmshc
> >            - const: rockchip,rk3588-dwcmshc
> > +      - items:
> > +          - const: sophgo,sg2044-dwcmshc
> > +          - const: sophgo,sg2042-dwcmshc
> >        - enum:
> >            - rockchip,rk3568-dwcmshc
> >            - rockchip,rk3588-dwcmshc
> > @@ -74,7 +77,9 @@ allOf:
> >        properties:
> >          compatible:
> >            contains:
> > -            const: sophgo,sg2042-dwcmshc
> > +            enum:
> > +              - sophgo,sg2042-dwcmshc
> > +              - sophgo,sg2044-dwcmshc
> 
> No need for this hunk because the new one has sophgo,sg2042-dwcmshc 
> already.
> 
> Rob

Thanks, I will remove it.

Regards,
Inochi

