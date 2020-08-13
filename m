Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2F77C243B45
	for <lists+linux-i2c@lfdr.de>; Thu, 13 Aug 2020 16:11:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726674AbgHMOLD (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 13 Aug 2020 10:11:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39550 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726673AbgHMOLC (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 13 Aug 2020 10:11:02 -0400
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com [IPv6:2a00:1450:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D3F2C061757
        for <linux-i2c@vger.kernel.org>; Thu, 13 Aug 2020 07:11:02 -0700 (PDT)
Received: by mail-ed1-x544.google.com with SMTP id df16so4304041edb.9
        for <linux-i2c@vger.kernel.org>; Thu, 13 Aug 2020 07:11:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:references:date:in-reply-to:message-id
         :user-agent:mime-version;
        bh=tG1MUBNAsLmbQEglvYfN5xXnzN2aNDeHMcXNuoqFeEs=;
        b=OUOYRmXFRNtmeSxeBHe+13RyoYU8vvnPYjNydh2ZupCvGAIutGrhkohwiT+t1zWipq
         dksupg3nFr1zKnDL7yKLIFoCaHC+GHkgIzQ4i0XIbIJZm6pnjEufm6DDo48ZSqBD07wI
         hJVVsICPf/q1/N/0mqF5PulCWBjSWSB1rey6WCirNckA6Py/iOIJZGWkQkutmPOh4OoO
         bCnBpyYF0Y8dDaK0ynJLWqKhd8g2cY/xxMYRFvi+Yb9dT2h8YYYRQT3fGLogiAeriStb
         jXrqCQHjK/MGpUSw2S0nN/1J5jO9uGJ/R5LlONNTt81uPeCDYhj67e6IvJ6KRmkMl39G
         3klw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:references:date
         :in-reply-to:message-id:user-agent:mime-version;
        bh=tG1MUBNAsLmbQEglvYfN5xXnzN2aNDeHMcXNuoqFeEs=;
        b=PwkDKuyXn9eTq3DkKoEqGqH8lN3GzjO4WiKMa5LMQcoy74UGKCXFPUVp3tvwk4VP9X
         pyXN3U9Xz+gFIu1s9qbfMe3MrjRneuN9brjggZ4Fb80AqUnsQAOLmPB8qWL87XC4MwDW
         ohBnEHTu9w7JqrJcqxGmVQfIKgsHP3Mfb3DeJ8FsiEOmoVvL+HUyN1I1hccbQLuviHJF
         R8GKBz/vD+zyK44yd7b/i7PTMqtkugXZ+2BZBOv0Yb2Fp/lFb6R2HDbQsVSwZ9oKgb6X
         1Zrp90S6Inig8BDx/zArTS79o3QAVVNhVUskLHJwDfd1EOjf6fnWMNX3gS9lj7ymDWib
         m9rQ==
X-Gm-Message-State: AOAM530KHFZxNx+eDaTe1bAkvVH3NX+cspN5KdBdGwllWoMyBvVKoAK3
        rNwBOPvsjbviZ6bGEVGaGUbt+BEF9xE=
X-Google-Smtp-Source: ABdhPJy865Rwml3rGVwQfD71omNM+80kEj18cMNvbICTJV5GC9gauuCvQU9M4bTQpAtB94ZmCm2JMQ==
X-Received: by 2002:a05:6402:c84:: with SMTP id cm4mr4858919edb.20.1597327861193;
        Thu, 13 Aug 2020 07:11:01 -0700 (PDT)
Received: from dell.be.48ers.dk ([195.162.189.230])
        by smtp.gmail.com with ESMTPSA id k6sm4198387ejg.81.2020.08.13.07.11.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2020 07:11:00 -0700 (PDT)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
        (envelope-from <peter@korsgaard.com>)
        id 1k6DwZ-0003Ai-V8; Thu, 13 Aug 2020 16:10:59 +0200
From:   Peter Korsgaard <peter@korsgaard.com>
To:     Mohammed Billoo <mab@mab-labs.com>
Cc:     linux-i2c@vger.kernel.org
Subject: Re: [PATCH] i2c: ocores: add gaisler to platform data
References: <20200811134426.7613-1-mab@mab-labs.com>
Date:   Thu, 13 Aug 2020 16:10:59 +0200
In-Reply-To: <20200811134426.7613-1-mab@mab-labs.com> (Mohammed Billoo's
        message of "Tue, 11 Aug 2020 09:44:26 -0400")
Message-ID: <87lfii7i18.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

>>>>> "Mohammed" == Mohammed Billoo <mab@mab-labs.com> writes:

Hi,

Please send i2c patches to the linux-i2c mailing list as well, so the
i2c maintainer can apply it.

 > There may be instances when the device tree is not suitable to interface
 > with the ocores implementation. For example, when the FPGA/ASIC is
 > not on the same silicon die (e.g. the communication between the CPU and
 > the FPGA/ASIC is over PCI), information about the ocore implementation,
 > such as whether the gaisler implementation is used, must be determined
 > during runtime. In this case, the client driver would prepopulate the
 > platform data during device instantiation. Thus, a boolean needs to be
 > added in the platform data, to instruct the i2c-ocores driver whether
 > the gaisler register callbacks should be used.

 > Signed-off-by: Mohammed Billoo <mab@mab-labs.com>
 > ---
 >  drivers/i2c/busses/i2c-ocores.c          | 4 ++++
 >  include/linux/platform_data/i2c-ocores.h | 1 +
 >  2 files changed, 5 insertions(+)

 > diff --git a/drivers/i2c/busses/i2c-ocores.c b/drivers/i2c/busses/i2c-ocores.c
 > index f5fc75b65a19..0975f6797069 100644
 > --- a/drivers/i2c/busses/i2c-ocores.c
 > +++ b/drivers/i2c/busses/i2c-ocores.c
 > @@ -647,6 +647,10 @@ static int ocores_i2c_probe(struct platform_device *pdev)
 >  i2c-> bus_clock_khz = pdata->bus_khz;
 >  		else
 >               i2c-> bus_clock_khz = 100;
 > +		if (pdata->gaisler) {
 > +			i2c->setreg = oc_setreg_grlib;
 > +			i2c->getreg = oc_getreg_grlib;
 > +		}
 >  	} else {
 >  		ret = ocores_i2c_of_probe(pdev, i2c);
 >  		if (ret)
 > diff --git a/include/linux/platform_data/i2c-ocores.h b/include/linux/platform_data/i2c-ocores.h
 > index e6326cbafe59..a3cb38f21417 100644
 > --- a/include/linux/platform_data/i2c-ocores.h
 > +++ b/include/linux/platform_data/i2c-ocores.h
 > @@ -16,6 +16,7 @@ struct ocores_i2c_platform_data {
 >  	bool big_endian; /* registers are big endian */
 >  	u8 num_devices; /* number of devices in the devices list */
 >  	struct i2c_board_info const *devices; /* devices connected to the bus */
 > +	bool gaisler; /* implementation is gaisler */

NIT: Perhaps it would be nicer to place this after big_endian, as it is
quite similar to that?

A clearer comment could be "Use Gaisler GRLIB accessors"

Other than that it looks good to me, thanks.

Acked-by: Peter Korsgaard <peter@korsgaard.com>

-- 
Bye, Peter Korsgaard
