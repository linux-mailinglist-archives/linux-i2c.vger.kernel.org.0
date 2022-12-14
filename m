Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5DA6064C88B
	for <lists+linux-i2c@lfdr.de>; Wed, 14 Dec 2022 13:00:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238325AbiLNMAB (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 14 Dec 2022 07:00:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34440 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238374AbiLNL7i (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 14 Dec 2022 06:59:38 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BBECA24F2A
        for <linux-i2c@vger.kernel.org>; Wed, 14 Dec 2022 03:58:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1671019115;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=Puk59mM8eVDxnAzNFx5aGXWzYXrsqC20wq+ZEPuJ168=;
        b=Yh97XS+YfYNfGPpyo0uPY+U0JXVYwp6yiA/2mD+nwczb++s2OvNjRrq1ldhQwGfPjKDGQw
        k+cHYIGd5e1FFPp6wezHHukyAOXXuG3a9uSegIzN0GM2kGacfGSsR7jkLH0H+nLXhrBHAJ
        SvFn1tW4fGlR5VKcAcG101VsmxMAX6k=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-638-sUXCmkuiNJS_YW50QQWfxw-1; Wed, 14 Dec 2022 06:58:34 -0500
X-MC-Unique: sUXCmkuiNJS_YW50QQWfxw-1
Received: by mail-wr1-f71.google.com with SMTP id h10-20020adfaa8a000000b0024208cf285eso3531933wrc.22
        for <linux-i2c@vger.kernel.org>; Wed, 14 Dec 2022 03:58:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Puk59mM8eVDxnAzNFx5aGXWzYXrsqC20wq+ZEPuJ168=;
        b=YKWPFLuRkMAIsy4URhgROkrwPgC8tcCokdlAz8bEt3p0nRUz5iC8kzg0mn9ZH/hjuE
         8Fdc8zFFt7qZKYsMwT0ppGXnklIF4s3U/Yi+N2URWrtWAQMeoAngdXrNK0SFmjw/z1aw
         QaAk8utCb/WIZ2d9GfF9Mo1xBcUDWoROreFBNKlKkYAV/mie25vyegi7ckDMnBtBkJtc
         u1diGX6/pnWKmxLjCk3VOm0u3tFn/wzdk8fijjW/WcQzrwa0pLgM4LS3tKEyrc1ytU7f
         Lk82R1tT9UnArJA4S5aL0+bO/5ZLn87qov4f2I1sqaSzuMgTw50qAXqhCYfGCJ2DNdsh
         S6qQ==
X-Gm-Message-State: ANoB5pmDOptDEq3eKsHxbpqfbxD3OV5Pt29Foz8X5IfVR2hLkilbR54z
        sF1+Dcl6e+DrZ3w/92bwh3neYDRMNCBgBM2ZohunKya2J8sU+a7HaQ+w8Q/KKJvOevaD79sdVXl
        7WN4ImMklA3ovMX5vmecC
X-Received: by 2002:a5d:526a:0:b0:242:877d:ca63 with SMTP id l10-20020a5d526a000000b00242877dca63mr16179201wrc.44.1671019113300;
        Wed, 14 Dec 2022 03:58:33 -0800 (PST)
X-Google-Smtp-Source: AA0mqf4HSxAPf40LKD9a4HZ7iVGC/QK8BhMe6SSXxWXIEd+STJY7Pm38ou+bHRi/WjDGVGhtNtqGUg==
X-Received: by 2002:a5d:526a:0:b0:242:877d:ca63 with SMTP id l10-20020a5d526a000000b00242877dca63mr16179181wrc.44.1671019113009;
        Wed, 14 Dec 2022 03:58:33 -0800 (PST)
Received: from redhat.com (bzq-82-81-161-50.red.bezeqint.net. [82.81.161.50])
        by smtp.gmail.com with ESMTPSA id u2-20020adff882000000b00241d21d4652sm2635751wrp.21.2022.12.14.03.58.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Dec 2022 03:58:32 -0800 (PST)
Date:   Wed, 14 Dec 2022 06:58:29 -0500
From:   "Michael S. Tsirkin" <mst@redhat.com>
To:     Viresh Kumar <viresh.kumar@linaro.org>
Cc:     Wolfram Sang <wsa@kernel.org>, asowang@redhat.com,
        Conghui <conghui.chen@intel.com>, linux-i2c@vger.kernel.org,
        virtualization@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org,
        Jian Jun Chen <jian.jun.chen@intel.com>
Subject: Re: [PATCH] MAINTAINERS: Update maintainer list for virtio i2c
Message-ID: <20221214065417-mutt-send-email-mst@kernel.org>
References: <20221214053631.3225164-1-conghui.chen@intel.com>
 <20221214063107.fazrfq3n26hw4ndl@vireshk-i7>
 <Y5mjcuCRP45ynJis@shikoro>
 <20221214105642.3xagckvbbgu5mubl@vireshk-i7>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221214105642.3xagckvbbgu5mubl@vireshk-i7>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Dec 14, 2022 at 04:26:42PM +0530, Viresh Kumar wrote:
> On 14-12-22, 11:20, Wolfram Sang wrote:
> > Dunno if this is really a rule, but if a maintainer steps out and makes
> > sure there is someone to pick up the work, this is more than welcome.
> > Way better than a stale entry in the MAINTAINERS file.
> 
> Sure, a stale entry is always bad.
> 
> > I mean, it does not limit the chance to have further maintainers, for
> > example. I believe in meritocracy here. Those who do and collaborate,
> > shall get responsibility. If not, then not. We can fix this, too, if
> > needed.
> > 
> > What is the reason for your question?
> 
> It was a general question that I asked myself and didn't know an
> answer to. I wasn't sure if adding someone to be a maintainer here to
> a driver, which they haven't contributed to until now (at least based
> on open source commits), is right or not, since this isn't a stale
> entry in MAINTAINERS anyway.
> 
> An entry as R: would be okay normally IMO, as this makes sure
> interested party is kept aware of the development in the area. An M:
> entry somehow gives a higher level of authority to the person and
> without any prior contributions, it feels tricky at least.
> 
> Anyway, I don't have any objection to the patch at least as it was
> primarily developed by Intel engineers.
> 
> Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

If a maintainer acks a patch I generally expect that the patch is good.
If we have a maintainer who's not familiar with the codebase, this
assumption does not hold.
R: would be ok with me.

> -- 
> viresh

