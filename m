Return-Path: <linux-i2c+bounces-3240-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F91B8B3F85
	for <lists+linux-i2c@lfdr.de>; Fri, 26 Apr 2024 20:43:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2BF9E285346
	for <lists+linux-i2c@lfdr.de>; Fri, 26 Apr 2024 18:43:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB12B6FBF;
	Fri, 26 Apr 2024 18:43:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pEpZMXqu"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B0FF4A23;
	Fri, 26 Apr 2024 18:43:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714157002; cv=none; b=kspB0dbJ9nkkwYCcEsbu7mRWEyG4fVEeDbQIIV7grsVGuz3Dz63gxUyrYxT7snQnowxfBt1fm1HW1zkzeF28wNcnXoBBtYyPpk/2G/xA3AyaLzjRw0cHBP2tW7taeiACgIwNEBkuBmn2RjzGDEIgVXAwbhyxF6CAkE5m1aC2njY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714157002; c=relaxed/simple;
	bh=//roZ7d56KeyEoiiQbKnxou+fpOtupIebykulRJaAnk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LAjx++ZR7WLEjmoTnCSR/QE01XoLaS5rUkwSIS8EUHcoU62Z4raSFyl8gLOeVdyecAn0+eKCujBr0043wrzcWDlDb1RVSZUoQfGGqJH7qKkm78TYl/SP4nP5JaMeDvCXfdVWqC48DL3Y0XQrw3jfzl0+70JVFfIKdfLzDt/7+II=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pEpZMXqu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E04B0C113CD;
	Fri, 26 Apr 2024 18:43:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714157002;
	bh=//roZ7d56KeyEoiiQbKnxou+fpOtupIebykulRJaAnk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pEpZMXquU9zZvYVZjS04pb+WnKxoGkbsYMhf9/TGM5BvUTar3e6Lvy52Q748UiPXi
	 +YMQeYBpomVn/1IK01fDbkBHSwj9PEbMomSkc1J0HisKywT/2EHN6jEPmlQCM0DD5U
	 y48DtWApNH3E3nHltE3hWBZErpw92MHtOvP/TVTYrxQcbufqXZEdzZcqbQqdG8JniR
	 vlQQoapcuHOqFyaged4CjkUOwro5cofI1yDjSbICZ7+2TysZw1F6CJp7d/38MsFFAX
	 rG7xFLtvuKBUcY8ZBh2yWPjubCehAQlfrJOGRB0Vet5TkWuFDEKiP14HcEY96EqFAY
	 ydH4x1g3aF2Dw==
Date: Fri, 26 Apr 2024 13:43:19 -0500
From: Rob Herring <robh@kernel.org>
To: Eddie James <eajames@linux.ibm.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-aspeed@lists.ozlabs.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-fsi@lists.ozlabs.org, linux-spi@vger.kernel.org,
	linux-i2c@vger.kernel.org, lakshmiy@us.ibm.com, krzk+dt@kernel.org,
	conor+dt@kernel.org, joel@jms.id.au, andrew@codeconstruct.com.au
Subject: Re: [PATCH v3 08/14] dt-bindings: fsi: ast2600-fsi-master: Switch to
 yaml format
Message-ID: <20240426184319.GA2558853-robh@kernel.org>
References: <20240425213701.655540-1-eajames@linux.ibm.com>
 <20240425213701.655540-9-eajames@linux.ibm.com>
 <5822e000-01d3-442c-bb52-04fab87cb3da@kernel.org>
 <24e7644e-f9ff-4a4b-8883-33b2f69b36cf@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <24e7644e-f9ff-4a4b-8883-33b2f69b36cf@linux.ibm.com>

On Fri, Apr 26, 2024 at 10:13:52AM -0500, Eddie James wrote:
> 
> On 4/26/24 01:25, Krzysztof Kozlowski wrote:
> > On 25/04/2024 23:36, Eddie James wrote:
> > > Switch to yaml for the AST2600 FSI master documentation.
> > > 
> > > Signed-off-by: Eddie James <eajames@linux.ibm.com>
> > > ---
> > >   .../fsi/aspeed,ast2600-fsi-master.yaml        | 72 +++++++++++++++++++
> > >   .../bindings/fsi/fsi-master-aspeed.txt        | 36 ----------
> > >   2 files changed, 72 insertions(+), 36 deletions(-)
> > >   create mode 100644 Documentation/devicetree/bindings/fsi/aspeed,ast2600-fsi-master.yaml
> > >   delete mode 100644 Documentation/devicetree/bindings/fsi/fsi-master-aspeed.txt
> > > 
> > > diff --git a/Documentation/devicetree/bindings/fsi/aspeed,ast2600-fsi-master.yaml b/Documentation/devicetree/bindings/fsi/aspeed,ast2600-fsi-master.yaml
> > > new file mode 100644
> > > index 000000000000..f053e3e1d259
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/fsi/aspeed,ast2600-fsi-master.yaml
> > > @@ -0,0 +1,72 @@
> > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/fsi/aspeed,ast2600-fsi-master.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: Aspeed FSI master
> > > +
> > > +maintainers:
> > > +  - Eddie James <eajames@linux.ibm.com>
> > > +
> > > +description:
> > > +  The AST2600 and later contain two identical FSI masters. They share a
> > > +  clock and have a separate interrupt line and output pins.
> > > +
> > > +properties:
> > > +  compatible:
> > > +    enum:
> > > +      - "aspeed,ast2600-fsi-master"
> > > +      - "aspeed,ast2700-fsi-master"
> > This wasn't tested. No quotes. Do you see any other example like this?
> 
> 
> Strangely this passes make dt_binding_check for me... And Rob's bot didn't
> seem to catch it either. Just an oversight, I'll fix it.

Disabled due to yamllint bug. The fix is now released, so that reminds 
me to go enable it.

Rob

