Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 65A81A9B4A
	for <lists+linux-i2c@lfdr.de>; Thu,  5 Sep 2019 09:11:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731732AbfIEHLJ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 5 Sep 2019 03:11:09 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:46889 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731501AbfIEHLJ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 5 Sep 2019 03:11:09 -0400
Received: by mail-wr1-f68.google.com with SMTP id h7so1306272wrt.13
        for <linux-i2c@vger.kernel.org>; Thu, 05 Sep 2019 00:11:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=DFvvnaHLzFEzaTnNYzUt4Q2hQTFq/NK+O6UpsbmEMb0=;
        b=By8LGyThV3tQ7KpjUQafQj2mWoVF3UaQyPDD/AsSXb+5tk4zZFZVekW3CeEG2npb2B
         Jmy5Qb0Gklgk/axCGfbNZJSWL5JklgbojPM3DCPn25IMckFHtdSMHFMkMKwn7/d9ZmWv
         NLlXUPiedZKGcQzpUT6V3EIMJJci8gkcWnpcauUrUpDTBdDfs6O8etqFgheEto1vISaT
         rTOEicKYLY89K5mHry30Y6vbjFHGz2jb/uZ/4t9ZzErtlzLlh8SbtbMZiSpSdYxh5rsz
         Kv529cVvW8zneJb4OdeHcTYd38NSZx322XL6q16Xz2Oj3s9WMBkYdcj0JhBNbdVGNIE9
         JkqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=DFvvnaHLzFEzaTnNYzUt4Q2hQTFq/NK+O6UpsbmEMb0=;
        b=KP3YqHOF7jaujhKCPzGmEtzwBhIsneV3AgtcRKTrvMkftlHOSdgMX/2KaWsC4NFmTn
         MH/9n0OwZVyFk0DwsgXQJ4EF/pU3P+TzTD5iTaO+IIAFarxC56WlHAXduY2i7IaetHU4
         nWpzCutaA6AYEAffDd54ngjGwrOahBbkxD88juD6mL1jj656bsK9MhCQ0bgC78WSNudU
         1hkX+ztUxbroY6SZnduCaAl5oNNxanh29E0UfNbUsNQE8KoqSE0Xh3oIMdglXazmLU4X
         yKy6N6XeGA2EZl51MA4avn900rec3Qa4VVl7n9QSdOFnPXild8y1OVGw6R+OghDo7STh
         8t/Q==
X-Gm-Message-State: APjAAAVmLPBSpAfpujZjzP5uPEKgx1Ja+Dhn1G4YXEY0eLxDH0cOQLx0
        93CIL/SzBZ7VL6qJ/GTfVsjGRg==
X-Google-Smtp-Source: APXvYqwmUfGIDO2UDqtQ8Ewygc0VpleSUBO6Yhj2gmAs7eRwG0RusGrqdiNi/OFtceHOm46lPN3l5g==
X-Received: by 2002:a5d:528a:: with SMTP id c10mr1153426wrv.111.1567667466248;
        Thu, 05 Sep 2019 00:11:06 -0700 (PDT)
Received: from dell ([95.147.198.36])
        by smtp.gmail.com with ESMTPSA id m18sm1455462wrg.97.2019.09.05.00.11.05
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 05 Sep 2019 00:11:05 -0700 (PDT)
Date:   Thu, 5 Sep 2019 08:11:03 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Wolfram Sang <wsa@the-dreams.de>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>, alokc@codeaurora.org,
        agross@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com,
        linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] i2c: qcom-geni: Provide an option to select FIFO
 processing
Message-ID: <20190905071103.GX26880@dell>
References: <20190904113613.14997-1-lee.jones@linaro.org>
 <20190904203548.GC580@tuxbook-pro>
 <20190904212337.GF23608@ninjato>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190904212337.GF23608@ninjato>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, 04 Sep 2019, Wolfram Sang wrote:

> On Wed, Sep 04, 2019 at 01:35:48PM -0700, Bjorn Andersson wrote:
> > On Wed 04 Sep 04:36 PDT 2019, Lee Jones wrote:
> > 
> > The subject implies that we select FIFO mode instead of DMA, but that's
> > not really true, because with DMA enabled we still fall back to FIFO for
> > messages below 32 bytes. 

Do you mean, we fall back to DMA?

> > So what this does it to disable DMA, which neither the subject or the DT
> > property describes.
> > 
> > Also missing is a description of why this is needed.
> 
> Yes.
> 
> I am willing to help to get this resolved soonish. However, I have
> issues with the approach.
> 
> It looks like a workaround to me. It would be interesting to hear which
> I2C client breaks with DMA and if it's driver can't be fixed somehow
> instead. But even if we agree on a workaround short term, adding a
> binding for this workaround seems like a no-go to me. We have to live
> with this binding forever. Sidenote: I could think of a generic
> 'disable-dma' which could be reused everywhere but we probably won't get
> that upstream that late in the cycle.
> 
> Is there no other way to disable DMA which is local to this driver so we
> can easily revert the workaround later?

This is the most local low-impact solution (nomenclature aside).

The beautiful thing about this approach is that, *if* the Geni SE DMA
ever starts working, we can remove the C code and any old properties
left in older DTs just become NOOP.  Older kernels with newer DTs
(less of a priority) *still* won't work, but they don't work now
anyway.

NB: QCom have also made it pretty clear that DTBs *must* match their
kernel version.  I know this is controversial amongst DT purists, but
it's still how QCom operate.

The offending line can be found at [0].  There is no obvious bug to
fix and this code obviously works well on some of the hardware
platforms using it.  But on our platform (Lenovo Yoga C630 - QCom
SMD850) that final command, which initiates the DMA transaction, ends
up rebooting the machine.

With regards to the nomenclature, my original suggestion was
'qcom,geni-se-no-dma'.  Would that better suit your request?

[0] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/soc/qcom/qcom-geni-se.c#n644

> > > Signed-off-by: Lee Jones <lee.jones@linaro.org>
> > > ---
> > >  drivers/i2c/busses/i2c-qcom-geni.c | 14 ++++++++++----
> > >  1 file changed, 10 insertions(+), 4 deletions(-)
> > > 
> > > diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
> > > index a89bfce5388e..dfdbce067827 100644
> > > --- a/drivers/i2c/busses/i2c-qcom-geni.c
> > > +++ b/drivers/i2c/busses/i2c-qcom-geni.c
> > > @@ -353,13 +353,16 @@ static void geni_i2c_tx_fsm_rst(struct geni_i2c_dev *gi2c)
> > >  static int geni_i2c_rx_one_msg(struct geni_i2c_dev *gi2c, struct i2c_msg *msg,
> > >  				u32 m_param)
> > >  {
> > > +	struct device_node *np = gi2c->se.dev->of_node;
> > >  	dma_addr_t rx_dma;
> > >  	unsigned long time_left;
> > > -	void *dma_buf;
> > > +	void *dma_buf = NULL;
> > >  	struct geni_se *se = &gi2c->se;
> > >  	size_t len = msg->len;
> > >  
> > > -	dma_buf = i2c_get_dma_safe_msg_buf(msg, 32);
> > > +	if (!of_property_read_bool(np, "qcom,geni-se-fifo"))
> > > +		dma_buf = i2c_get_dma_safe_msg_buf(msg, 32);
> > > +
> > >  	if (dma_buf)
> > >  		geni_se_select_mode(se, GENI_SE_DMA);
> > >  	else
> > > @@ -392,13 +395,16 @@ static int geni_i2c_rx_one_msg(struct geni_i2c_dev *gi2c, struct i2c_msg *msg,
> > >  static int geni_i2c_tx_one_msg(struct geni_i2c_dev *gi2c, struct i2c_msg *msg,
> > >  				u32 m_param)
> > >  {
> > > +	struct device_node *np = gi2c->se.dev->of_node;
> > >  	dma_addr_t tx_dma;
> > >  	unsigned long time_left;
> > > -	void *dma_buf;
> > > +	void *dma_buf = NULL;
> > >  	struct geni_se *se = &gi2c->se;
> > >  	size_t len = msg->len;
> > >  
> > > -	dma_buf = i2c_get_dma_safe_msg_buf(msg, 32);
> > > +	if (!of_property_read_bool(np, "qcom,geni-se-fifo"))
> > > +		dma_buf = i2c_get_dma_safe_msg_buf(msg, 32);
> > > +
> > >  	if (dma_buf)
> > >  		geni_se_select_mode(se, GENI_SE_DMA);
> > >  	else



-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
