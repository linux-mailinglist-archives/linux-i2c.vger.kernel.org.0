Return-Path: <linux-i2c+bounces-6269-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CAB7296E13B
	for <lists+linux-i2c@lfdr.de>; Thu,  5 Sep 2024 19:36:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0914C1C22CF6
	for <lists+linux-i2c@lfdr.de>; Thu,  5 Sep 2024 17:36:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 507FF1A7278;
	Thu,  5 Sep 2024 17:35:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="J+hnP9Ji"
X-Original-To: linux-i2c@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DD0B1A0B0F;
	Thu,  5 Sep 2024 17:35:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725557754; cv=none; b=KUpVWsFtVqVJ7qZEy/NYWDd5l8iO5TWA5xwFPTEFGNKiqWyliQkL7eHWjGYmkF+X/ucaId7TsQOt0lSiI/Fvx9QvbXnrDlvVdhW18aXY/PuwDaKYq3Ch7+NdpRdJveK2bNpDz77F8MqjgIPGb3VNPiH0UH4B6ZPbkL3CjL/oKVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725557754; c=relaxed/simple;
	bh=+Ix0/shqPUH2+nPrGCJrgsVXFJvl6qQTI8Zf7IDHPPY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pCdkTXxW2EBVXA3XFMSWkEr6+3ySSnmeVNu/cZo9l7xJCy4qimx3wGn9kDgWhhE/WiCwsB0a1DU6Mcyuxq237mFTK3vhvmFzD9LtlabtIvJNZEV2/+e16qc8qvRtjTWGmcSdwpGjOW8hoFodU8s8tkLzLe08jk1ZIWUPvU1TKrc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=J+hnP9Ji; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Transfer-Encoding:Content-Disposition:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Content-Disposition:
	In-Reply-To:References; bh=0wipyiTddfP/CWHt7NIzva6RCElOIDgx1km2W0c+rPk=; b=J+
	hnP9JiAKb1OX9B16ISlFZSsO+TNRgKAavhQvVUTPEZHtPuEQBbYpxhJtyzsHHbQ/gnObxWMTgfgwc
	Fahtob7m1UXPN2bbrEDblnD3XsoAVgVdjxajit7kKNVJ1dOswiVn0BAHBEVdgHT9wbV1iihec6rYs
	j9puqOU3Q1wjdHc=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1smGOL-006hpo-3v; Thu, 05 Sep 2024 19:35:33 +0200
Date: Thu, 5 Sep 2024 19:35:33 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Nikunj Kela <quic_nkela@quicinc.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, andersson@kernel.org,
	konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, rafael@kernel.org, viresh.kumar@linaro.org,
	herbert@gondor.apana.org.au, davem@davemloft.net,
	sudeep.holla@arm.com, andi.shyti@kernel.org, tglx@linutronix.de,
	will@kernel.org, robin.murphy@arm.com, joro@8bytes.org,
	jassisinghbrar@gmail.com, lee@kernel.org, linus.walleij@linaro.org,
	amitk@kernel.org, thara.gopinath@gmail.com, broonie@kernel.org,
	cristian.marussi@arm.com, rui.zhang@intel.com, lukasz.luba@arm.com,
	wim@linux-watchdog.org, linux@roeck-us.net,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
	linux-crypto@vger.kernel.org, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
	iommu@lists.linux.dev, linux-gpio@vger.kernel.org,
	linux-serial@vger.kernel.org, linux-spi@vger.kernel.org,
	linux-watchdog@vger.kernel.org, kernel@quicinc.com,
	quic_psodagud@quicinc.com,
	Praveen Talari <quic_ptalari@quicinc.com>
Subject: Re: [PATCH v2 16/21] dt-bindings: spi: document support for SA8255p
Message-ID: <1b72ee5e-544d-4f9e-8915-a5d9d0244c8f@lunn.ch>
References: <2f11f622-1a00-4558-bde9-4871cdc3d1a6@lunn.ch>
 <204f5cfe-d1ed-40dc-9175-d45f72395361@quicinc.com>
 <70c75241-b6f1-4e61-8451-26839ec71317@kernel.org>
 <75768451-4c85-41fa-82b0-8847a118ea0a@quicinc.com>
 <ce4d6ea9-0ba7-4587-b4a7-3dcb2d6bb1a6@kernel.org>
 <4896510e-6e97-44e0-b3d7-7a7230f935ec@quicinc.com>
 <b1ad1c7a-0995-48e0-8ebc-46a39a5ef4b3@kernel.org>
 <515a2837-69c3-47b2-978b-68ad3f6ad0fc@quicinc.com>
 <0ba03b8e-4dd5-4234-823e-db4c457fa292@lunn.ch>
 <63f988eb-e638-48fa-b566-3df39588bf7c@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <63f988eb-e638-48fa-b566-3df39588bf7c@quicinc.com>

On Thu, Sep 05, 2024 at 09:39:54AM -0700, Nikunj Kela wrote:
> 
> On 9/5/2024 9:23 AM, Andrew Lunn wrote:
> >> If the QUPs yaml changes are not included in the same series with
> >> i2c,serial yaml changes, you see these errors:
> >>
> >> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/soc/qcom/qcom,geni-se.example.dtb: geniqup@9c0000: serial@990000:compatible:0: 'qcom,sa8255p-geni-uart' is not one of ['qcom,geni-uart', 'qcom,geni-debug-uart']
> >> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/soc/qcom/qcom,geni-se.example.dtb: geniqup@9c0000: i2c@984000:compatible:0: 'qcom,sa8255p-geni-i2c' is not one of ['qcom,geni-i2c', 'qcom,geni-i2c-master-hub']
> > So you have a couple of options:
> >
> > 1) It sounds like you should get the QUP changes merged first. Then
> >    submit the i2c,serial changes. Is there a reason you cannot do
> >    this? Is there a mutual dependency between these two series, or
> >    just a one way dependency?
> 
> The ask in this thread is to create new yaml files since existing one is
> using generic compatibles. With new yaml, we would need to provide
> example and can't avoid it. If we have to provide example of QUP node,
> IMO, we should provide a few subnodes as well since just QUP node
> without subnodes(i2c/serial/spi)  will not be very useful.

Does it need to be useful, at the beginning? Was the development done
all at once, i2c, serial and spi all mixed together, inseparable? More
likely, you have a set of patches adding some sort of base, and
hopefully a DT binding patch for that base. Then you add a driver in
drivers/tty/serial, with patches which extend the DT binding with the
serial port. You then add a driver in driver/i2c/busses and extend the
DT binding for I2C. And then add a driver for SPI in drivers/spi,
which again extends the DT binding?

This would be typical for how an MFD would be posted. Please go search
the lists for examples of MFDs you might be able to follow.

	Andrew


