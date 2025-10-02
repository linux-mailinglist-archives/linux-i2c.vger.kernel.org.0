Return-Path: <linux-i2c+bounces-13351-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5720EBB3EDE
	for <lists+linux-i2c@lfdr.de>; Thu, 02 Oct 2025 14:46:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9E01E3ADA66
	for <lists+linux-i2c@lfdr.de>; Thu,  2 Oct 2025 12:46:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD032310655;
	Thu,  2 Oct 2025 12:46:11 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from cstnet.cn (smtp84.cstnet.cn [159.226.251.84])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFCDB285047;
	Thu,  2 Oct 2025 12:46:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.84
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759409171; cv=none; b=eziqUksS3CfYnLoJShiiyJAJKxxQbZUganMcpVFPV3LlNpcTTSXDp0ypt3l+M3qRyMF6yK1GzVjIBf+Pl6WhM3SIv2OYXpmBOvcGKM1W4yn2e4ea8Pwfl/ePj4KGix0Uut4bLCr9HbtEPvaNCAUvoz2YxLIQNuikpatmSd0mX9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759409171; c=relaxed/simple;
	bh=6vCoSI8TiosmG7nf7cJMDZZ4HVDCR/IA5rNM0JedGs0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=iSIqJ8l+zO11tKCSJrE/ehiSmE3pMPZ6fjV0jfW71eOiYT/Vaz/mpR46mqodD4nnJCPTbhzsLHYKLOXUmC1cQ3pLa5vORhd/NO9Fh1E9qVu874rH4OSCIHWQE59G60lGORa7NLJZfbPQXo3XwTpO9X2IaFLk1pp/zFX6mt4khQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from localhost.localdomain (unknown [202.112.113.212])
	by APP-05 (Coremail) with SMTP id zQCowAAXtg_7c95o+hGiCg--.49759S2;
	Thu, 02 Oct 2025 20:45:57 +0800 (CST)
From: Ma Ke <make24@iscas.ac.cn>
To: andi.shyti@kernel.org
Cc: akpm@linux-foundation.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	make24@iscas.ac.cn,
	shyam-sundar.s-k@amd.com,
	stable@vger.kernel.org,
	syniurge@gmail.com,
	wsa@kernel.org
Subject: Re: [PATCH v2] i2c: fix reference leak in MP2 PCI device
Date: Thu,  2 Oct 2025 20:45:47 +0800
Message-Id: <20251002124547.1506-1-make24@iscas.ac.cn>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <7cu6uvwjki72rz6zoshfg3vonawikiasxheotmrsowqoalk2jb@7iu7cenha7p5>
References: <7cu6uvwjki72rz6zoshfg3vonawikiasxheotmrsowqoalk2jb@7iu7cenha7p5>
X-CM-TRANSID:zQCowAAXtg_7c95o+hGiCg--.49759S2
X-Coremail-Antispam: 1UD129KBjvJXoW7uryfZryUJryfWry3ZF4DCFg_yoW8Cw17pF
	Zrta1rArZ8Gr4kXrn8Xw4UZFyfXw40v3yrWrWIyw1Y93Z8ZFWDKry8AFyY9w1Y9rWDAr1I
	qay7Ja4furyIqa7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9G14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVWxJr
	0_GcWlnxkEFVAIw20F6cxK64vIFxWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xv
	F2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r
	4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I
	648v4I1lc7CjxVAaw2AFwI0_Jw0_GFylc2xSY4AK67AK6ryUMxAIw28IcxkI7VAKI48JMx
	C20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAF
	wI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20x
	vE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v2
	0xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxV
	W8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VUjNtx3UUUUU==
X-CM-SenderInfo: ppdnvj2u6l2u1dvotugofq/
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>

On Thu, 2 Oct 2025 at 07:56, Andi Shyti <andi.shyti@kernel.org> wrote:
> Hi,
> 
> > diff --git a/drivers/i2c/busses/i2c-amd-mp2-pci.c b/drivers/i2c/busses/i2c-amd-mp2-pci.c
> > index ef7370d3dbea..60edbabc2986 100644
> > --- a/drivers/i2c/busses/i2c-amd-mp2-pci.c
> > +++ b/drivers/i2c/busses/i2c-amd-mp2-pci.c
> > @@ -458,13 +458,16 @@ struct amd_mp2_dev *amd_mp2_find_device(void)
> >  {
> >  	struct device *dev;
> >  	struct pci_dev *pci_dev;
> > +	struct amd_mp2_dev *mp2_dev;
> >  
> >  	dev = driver_find_next_device(&amd_mp2_pci_driver.driver, NULL);
> >  	if (!dev)
> >  		return NULL;
> >  
> >  	pci_dev = to_pci_dev(dev);
> > -	return (struct amd_mp2_dev *)pci_get_drvdata(pci_dev);
> > +	mp2_dev = (struct amd_mp2_dev *)pci_get_drvdata(pci_dev);
> > +	put_device(dev);
> > +	return mp2_dev;
> 
> the patch is good, but I don't think you need to declare mp2_dev
> because to_pci_dev(dev) should work even without hodling the
> reference of dev.
Thank you for your feedback. The declaration of the temporary variable
mp2_dev in the patch may be necessary because we need to save the 
result of pci_get_drvdata(pci_dev) before calling put_device(dev). If 
we do not do this and instead call put_device(dev) first before 
returning pci_get_drvdata(pci_dev), it may lead to the deallocation of
dev, thereby invalidating pci_dev. Accessing its driver data at this 
point could potentially trigger a use-after-free error. Therefore, the
temporary variable ensures that the driver data remains safely 
accessible even after the reference is released. So perhaps we need to
retain the declaration of this temporary variable?

Best regards,
Ma Ke
> 
> I also have to agree with Markus that something like:
> 
> struct device *dev __free(put_device) = ...; /* it can also be NULL */
> 
> would work nicer.
> 
> Thanks,
> Andi
> 
> >  }
> >  EXPORT_SYMBOL_GPL(amd_mp2_find_device);
> >  
> > -- 
> > 2.17.1
> > 


