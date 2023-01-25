Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3E1DF67B38E
	for <lists+linux-i2c@lfdr.de>; Wed, 25 Jan 2023 14:39:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229827AbjAYNjx (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 25 Jan 2023 08:39:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35428 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235377AbjAYNjw (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 25 Jan 2023 08:39:52 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 85791568A6
        for <linux-i2c@vger.kernel.org>; Wed, 25 Jan 2023 05:39:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1674653943;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Sxzotnx/8u7CTeCRsf3MJY8+svrxvajdNHO0lRdFPkg=;
        b=MuIFaMLdJ7x/dKw1ppNDS3oCUDen14eFbqbnZzroATFuOry9ej7ayLdZqxuVFPcQwWAsbU
        v0AUPUK0MY5Z72500q0yYcbrvlh4KptfpyPryGjAgpXTWo6lUmaQaDwQwGrtfYMOfaEkzT
        PFZ2qzBhJG8KRm5r4V2gxPRr7NOz1LQ=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-398-3wXnGtPSNqaV8loj2zesSA-1; Wed, 25 Jan 2023 08:39:02 -0500
X-MC-Unique: 3wXnGtPSNqaV8loj2zesSA-1
Received: by mail-ej1-f72.google.com with SMTP id qf20-20020a1709077f1400b0086ec9755517so12087492ejc.15
        for <linux-i2c@vger.kernel.org>; Wed, 25 Jan 2023 05:39:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Sxzotnx/8u7CTeCRsf3MJY8+svrxvajdNHO0lRdFPkg=;
        b=cGmDR9ykWfEdqPGIAtqBlIkgFNG1s/R8LFI2Qy+nktgzyTDptk2S+dUEdeZnxA4cxo
         vZVqri+lyvh/L+fu4815QDlrFNB3KAEH3A6xqK5+2FnAfEvroayLFhmsjp3b/WZo+U7Z
         mD/XDkYZG2mmRxXVk938JyjrKCNxm6i9ArXzXb8NBQKmSY85RgsO9F8+N5fJL3SXEDOz
         J77yj1bVxfvpL+VQ8LfWdh0ozdNL85VVJuYLPDyLDr7QYNmAOqCvWJCTZqfYOrVEKYlX
         qCP2RcdfMefULpdfC1oDFXXTUOW+5EJLkYHB9rkO+8Ww0q+ZFH+GDLjF56mfWA8stg1u
         AgUw==
X-Gm-Message-State: AFqh2kq1+MHFyg9BzfscIuJC0TsR+qngDwJjKfDzj5IcmJ+UaFU2nzPr
        msKFWxUSOIQvp195tlhB1Xgk/YXHQvt8d9aRMkbd8k3B67JtYOxtmhRHxisXes0Gw6LMZhVDyYv
        v6DY2ziH2OWHzslSr6iXS
X-Received: by 2002:aa7:de9a:0:b0:482:d62c:cde with SMTP id j26-20020aa7de9a000000b00482d62c0cdemr48671599edv.13.1674653940736;
        Wed, 25 Jan 2023 05:39:00 -0800 (PST)
X-Google-Smtp-Source: AMrXdXuSG9aMyPwztmzmC+kCrInOnj8mPzQEuCzuD4sdr5qzPHQ3vYBP3LEEv2c86PDwwr+WEAua5A==
X-Received: by 2002:aa7:de9a:0:b0:482:d62c:cde with SMTP id j26-20020aa7de9a000000b00482d62c0cdemr48671585edv.13.1674653940587;
        Wed, 25 Jan 2023 05:39:00 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id o2-20020aa7c7c2000000b0047eeaae9558sm2344417eds.60.2023.01.25.05.38.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Jan 2023 05:39:00 -0800 (PST)
Message-ID: <383fda33-143d-9e8e-1f7d-080931ae4496@redhat.com>
Date:   Wed, 25 Jan 2023 14:38:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH resend 0/2] i2c/extcon: intel-cht-wc: Lenovo Yoga Tab 3
 Pro YT3-X90F support
Content-Language: en-US, nl
To:     Wolfram Sang <wsa@kernel.org>,
        MyungJoo Ham <myungjoo.ham@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Lee Jones <lee.jones@linaro.org>
References: <20230125111209.18343-1-hdegoede@redhat.com>
 <Y9Et7nlUmiiPrFUQ@ninjato>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <Y9Et7nlUmiiPrFUQ@ninjato>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi,

On 1/25/23 14:26, Wolfram Sang wrote:
> 
>> I'm resending these 2 patches since they seem to have fallen through
>> the cracks.
> 
> Which tree should the patches go via? I am assuming not-i2c, but maybe I
> am wrong?

That is a good point. I was under the assumption that the matching MFD
patch, which I did not resend, was already merged. But I'm wrong,
sorry about this.

So I'll do a v2 resend with 3 patches which does include the MFD
patch and then I guess ideally all 3 patches would go through
the MFD tree.

Wolfram, may I/we have your ack for merging the small i2c change
through the MFD tree?

The extcon patch already has an ack for that. So I'll hold of
on sending out a v2 with the missing patch until I have your
ack, so that v2 will be fully ready to merge through the MFD
tree.

Regards,

Hans


