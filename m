Return-Path: <linux-i2c+bounces-6092-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A80BA96AC8F
	for <lists+linux-i2c@lfdr.de>; Wed,  4 Sep 2024 00:55:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2D850B22517
	for <lists+linux-i2c@lfdr.de>; Tue,  3 Sep 2024 22:55:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EEDB01B9844;
	Tue,  3 Sep 2024 22:55:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NRlwE7Lv"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A52C21EC01E;
	Tue,  3 Sep 2024 22:55:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725404139; cv=none; b=HDdeheAfUDv9h9LMdhbxzTzBedE8EQC2DOC9EhpSooKGfeezxGqGZ2RrH1+Ftx21QE7Zd00VcwqbewSiZDl7Fraadmx7TUvQ9TKmmxllt/zPX36G5JoXX0hgxU+37NlaR1VthagUD3mYZJVL/+INHQH/SOuKToPAH6vnS3kbUU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725404139; c=relaxed/simple;
	bh=JaFeuTgF5zkNdK6dIe1LkaFh5oqtU0LVvqZXpKHmJ4A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H23HZ0j5s+FL2D60kn5PWSN0KyWH6Gnz6WOhXNSyxGw2nv0JZFCradt52ZA+Vk5H0E59JclAvS4US2vNbiP134YHBSud4um3w6z/61GoTPnKkdRLMWKsleU1AMWzxyE8iBgeLnp47yRQKE33jIGkpx3UolJH7Qpu39Q38K7c2Oo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NRlwE7Lv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6410EC4CEC4;
	Tue,  3 Sep 2024 22:55:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725404139;
	bh=JaFeuTgF5zkNdK6dIe1LkaFh5oqtU0LVvqZXpKHmJ4A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NRlwE7LvocDygbDhIt5g8nT6IbP52AIzW+TpfoYqne4Y4W56FzQIU1lS/Fl83xPJA
	 w6UMPMDvkrdQHJ5UJ5MGPebfjrxDgk49mGWgmR/GZoDkCV4tNGya/RHngnTKhlN5GC
	 P/mHemNWkgkbmcUr3sPPs9ROmLh4fFLML/4nPYwrF9XHsUSoIp9EMR61R0o7obXd/c
	 A5iL0S0yjha5eEMpnEAuA2frZEit4Bj+IKiSWh8Yggq0S/mIbStNOMU85gwGEtEEY+
	 GarctGUW2gaEnOXxzQV9rxbcRjju9E8BUUN01y8IWZ8m/JeqVCb5+Y42UGMCVZeb7W
	 xgAIYBPilOqDg==
Date: Wed, 4 Sep 2024 00:55:35 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Ma Ke <make24@iscas.ac.cn>, jochen@scram.de, grant.likely@linaro.org, 
	thierry.reding@gmail.com, rob.herring@calxeda.com, linuxppc-dev@lists.ozlabs.org, 
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] of/irq: handle irq_of_parse_and_map() errors
Message-ID: <u4qlhdhmya5pwfboffbuvmgabmmpjxh6dfqptw65k5fiiaeqoy@pnmzj2lgh5z4>
References: <20240830142127.3446406-1-make24@iscas.ac.cn>
 <90924209-888d-4ff3-8f60-f82a073bcf1c@csgroup.eu>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <90924209-888d-4ff3-8f60-f82a073bcf1c@csgroup.eu>

On Tue, Sep 03, 2024 at 06:56:41PM GMT, Christophe Leroy wrote:
> Le 30/08/2024 à 16:21, Ma Ke a écrit :
> > Zero and negative number is not a valid IRQ for in-kernel code and the
> > irq_of_parse_and_map() function returns zero on error.  So this check for
> > valid IRQs should only accept values > 0.
> 
> unsigned int irq_of_parse_and_map(struct device_node *node, int index);
> 
> I can't see how an 'unsigned int' can be negative.

hehe... correct... even though looks like we are walking on a
slackline, relying too much that no one in the future, inside
irq_of_parse_and_map() (and various callers), someone will try to
fit an -ENOSOMETHING into the unsigned int.

I wouldn't mind something like this[*] to ensure I can sleep
soundly.

Thanks for the review,
Andi

[*]
diff --git a/kernel/irq/irqdomain.c b/kernel/irq/irqdomain.c
index cea8f6874b1fb..df44a8ffa6843 100644
--- a/kernel/irq/irqdomain.c
+++ b/kernel/irq/irqdomain.c
@@ -954,6 +954,8 @@ unsigned int irq_create_fwspec_mapping(struct irq_fwspec *fwspec)
 out:
        mutex_unlock(&domain->root->mutex);

+       BUG_ON(virq < 0);
+
        return virq;
 }
 EXPORT_SYMBOL_GPL(irq_create_fwspec_mapping);

> Christophe
> 
> > 
> > Cc: stable@vger.kernel.org
> > Fixes: f7578496a671 ("of/irq: Use irq_of_parse_and_map()")
> > Signed-off-by: Ma Ke <make24@iscas.ac.cn>
> > ---
> >   drivers/i2c/busses/i2c-cpm.c | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/i2c/busses/i2c-cpm.c b/drivers/i2c/busses/i2c-cpm.c
> > index 4794ec066eb0..41e3c95c0ef7 100644
> > --- a/drivers/i2c/busses/i2c-cpm.c
> > +++ b/drivers/i2c/busses/i2c-cpm.c
> > @@ -435,7 +435,7 @@ static int cpm_i2c_setup(struct cpm_i2c *cpm)
> >   	init_waitqueue_head(&cpm->i2c_wait);
> >   	cpm->irq = irq_of_parse_and_map(ofdev->dev.of_node, 0);
> > -	if (!cpm->irq)
> > +	if (cpm->irq <= 0)
> >   		return -EINVAL;
> >   	/* Install interrupt handler. */

