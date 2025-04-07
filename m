Return-Path: <linux-i2c+bounces-10194-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F364A7F0FF
	for <lists+linux-i2c@lfdr.de>; Tue,  8 Apr 2025 01:32:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3F56B176BE1
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Apr 2025 23:32:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7EA6A227EAB;
	Mon,  7 Apr 2025 23:32:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NO0ok/7V"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6A87801;
	Mon,  7 Apr 2025 23:32:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744068743; cv=none; b=UfDWKgDnNzszohQLJWfPGIYKKz4gvZDIDj8zBQmCRc/1/DTBns3WzXWzMHKYB4mCtdfcQobDxVmQE1tNecFlkZ76ZQxroEMGXNkLA0sIamyHjbME2V6xF+uVZWPULekIODwWqMteZKwytt9IKMxxGt/M5YIa5bGgEmi8dSGNp/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744068743; c=relaxed/simple;
	bh=y0VMyqj2jrwxkMMoBpqQeCXfy0c7ujpzElgdYnxnprE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q8eRrmIxXZio4iXqN6178caapVIj4LzAvp+yc87k+aXOKfoajBuNzOiyfSqbbFLMGuY4igLTCogEkBfxjEEoxOmFsMAV+sP+zNHaQJ1JG02Hv+FdOAYsYSLCX2vd9K/Vzj+H3UtsyswiiqWT1/1cFEdnGGCdV9yMDP7LFqNNzNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NO0ok/7V; arc=none smtp.client-ip=209.85.222.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-7c55500d08cso468745185a.0;
        Mon, 07 Apr 2025 16:32:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744068740; x=1744673540; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jJIvZC6BOhqiO/IQEbyhQ90MLD58EsSNP3rWCk4udso=;
        b=NO0ok/7V9Dao8S50aFu2gAXouo/MYy9LTU+ozAcgQjk4k4UmScdXXXxXxqaH5Y6OGJ
         SNL/prhNQbh8sQBPQ9Ju6U/dINgkaaDnxEb5y9go/exb2cSKBwlyrUTYk3s4u0v084x9
         7Vzi6g6vSr/BSYmErI9j9cVGVDyuaBjemreD//ld6ljqk/vbOIDzzubTymuVfZajTmxr
         uuKMleYEDVmqYewHsP8lWMU9bnIbH+CsPKLrLpChk+iMqXnjUb1Al2DNh5Ol/RnongxN
         PNCK55n0wB9ZQ/x9H0BIhFuFtpKnegUvMf9zKJvFhsPhDe0MqPVvHf75NHz+ELASA1j8
         niUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744068740; x=1744673540;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jJIvZC6BOhqiO/IQEbyhQ90MLD58EsSNP3rWCk4udso=;
        b=JnB36knO2Mjgznk3WOCkpX56mfFndTMie+QX4k28DlPhjhH71g84/c69GyPAPA46OR
         QK52vfUKqGFwZLoCA8Lr7X6YAAnIolKdmJRMCfMNDDonzttTc8xiULxlHztHU7PKMJ/K
         mDHyEeePkYc4zEuGa2kTEk0z3rbL0HTZSJYazTTUwuZsC1nBnL0n3DXfCcYnIaVXS1KC
         CTPBCiYzruy23ZJrAB6WW16HVqJUbE8XkuvD1lDcYmFGoX2hvfqAQJVInw/odG3o1fSX
         nRuxFfCBzlfJ90qc3ggpx1rETlW/2959SQXCXdEimYvd1ED+GHlAXaw3b6fcVxj/B8Tl
         kkQQ==
X-Forwarded-Encrypted: i=1; AJvYcCUU7HwrqLrIkB+lXmNCYS3z0q0KPoc6kTDNRyafRhOK/FAHl6a0Ja6AA2ZcPKOg4tyoCQ0AwYPFAUNV@vger.kernel.org, AJvYcCVcXaXjfqgKQep2iWf6icuEkYwyDMf3FaWQdHinjseh2IXaKN8q3if5ESLU4EUxIMgpbTjRJdq9ml19cLP5@vger.kernel.org, AJvYcCW/dkSlLBXV5u9u82zDEyU/YbP+ljoc4S6JLiNk+5HHWpUtJA2AOPBaORymKAVgfzYe6w6XIt4QvSrG@vger.kernel.org, AJvYcCWK7ee3bAcAmNuE8ECNpjIfR4jDtPKOTJ1cJIMpqn6D4QtvgCOzG+5Bn/ykOFC4Tv4Mz3FJBI7E8HfF@vger.kernel.org, AJvYcCWWqgPsJsXGccUqeuOYeNg9q2qKawWpgl2jL8Q/8ePn6ATDq8oqFj9RnMQdjHXCpCW5rXWrBGSSAe+Myys=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8KKJwWLXwKK+2kSL6ee96xJriDesuzqlHxa1syEt4Sr758Qpr
	tmxy+Sap0UkFLls/TEsuevjJb2mRvJhROKIIrBpsZ/dKXSObJFLq
X-Gm-Gg: ASbGncu6RL8QYwQsxZkPbuzfgJ1vw4sPeHmMFYOS3KJ+VD4VttYnjrWoGKIk5cy0ZXq
	9jSa6xG0oKFi8Ws8bGQuS5iwYLlIzOu1PMuSEH7vJ3rd0CPU8Rg127Dm33PTgmDrN7ssj8/UgfV
	qq0otk2SwAsDVWdYABTGBFJ4yJ36FwpjQQNX6RT3KjFp9fPK1YmP2c/pVYfBJuC1R+up6p0sois
	JRWb2AhRuyT+qDyon+Z/V5nbQHD3+Rhyo/cfwgRx1rC0PZr42tQs4HEz3gpoRdWKnLm+f6+sfQN
	E3baHTpnlIIyOoatgYOX
X-Google-Smtp-Source: AGHT+IEKkMIItDnAtEbc/6DeDUtD3EXh0WmABN9nky7dyvGG/jJvA+lzzO9SpmOhIoNbdRJ6S7A1Kw==
X-Received: by 2002:a05:6214:762:b0:6e8:e828:820d with SMTP id 6a1803df08f44-6f0b74bfde0mr179951146d6.36.1744068740691;
        Mon, 07 Apr 2025 16:32:20 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id 6a1803df08f44-6ef0f00e821sm65227956d6.34.2025.04.07.16.32.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 16:32:20 -0700 (PDT)
Date: Tue, 8 Apr 2025 07:31:44 +0800
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
Subject: Re: [PATCH 7/9] dt-bindings: i2c: dw: Add Sophgo SG2044 SoC I2C
 controller
Message-ID: <eltevzydjle25nyte5xn5mwxssi26awl4l4sgrz3v7h7m7vgur@tajtirx3up3x>
References: <20250407010616.749833-1-inochiama@gmail.com>
 <20250407010616.749833-8-inochiama@gmail.com>
 <20250407140232.GA2165777-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250407140232.GA2165777-robh@kernel.org>

On Mon, Apr 07, 2025 at 09:02:32AM -0500, Rob Herring wrote:
> On Mon, Apr 07, 2025 at 09:06:12AM +0800, Inochi Amaoto wrote:
> > Add compatible string for Sophgo SG2044 SoC I2C controller which can be
> > used specifically for the SG2044 SoC.
> > 
> > Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> > ---
> >  .../devicetree/bindings/i2c/snps,designware-i2c.yaml          | 4 ++++
> >  1 file changed, 4 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/i2c/snps,designware-i2c.yaml b/Documentation/devicetree/bindings/i2c/snps,designware-i2c.yaml
> > index bc5d0fb5abfe..677b39865af0 100644
> > --- a/Documentation/devicetree/bindings/i2c/snps,designware-i2c.yaml
> > +++ b/Documentation/devicetree/bindings/i2c/snps,designware-i2c.yaml
> > @@ -38,6 +38,10 @@ properties:
> >            - const: snps,designware-i2c
> >        - description: Baikal-T1 SoC System I2C controller
> >          const: baikal,bt1-sys-i2c
> > +      - description: Sophgo SoCs I2C controller
> > +        items:
> > +          - const: sophgo,sg2044-i2c
> > +          - const: snps,designware-i2c
> 
> This is not a great pattern we've started. T-HEAD, Ocelot, and this 
> should all be combined into 1 enum. The description here is not that 
> useful.
> 

I agree and am fine to do this.

Regard,
Inochi

