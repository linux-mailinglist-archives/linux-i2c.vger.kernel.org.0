Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CDF856567CE
	for <lists+linux-i2c@lfdr.de>; Tue, 27 Dec 2022 08:22:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229844AbiL0HW5 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 27 Dec 2022 02:22:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42946 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229998AbiL0HWr (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 27 Dec 2022 02:22:47 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6422323E
        for <linux-i2c@vger.kernel.org>; Mon, 26 Dec 2022 23:22:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1672125726;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=zfKUWZq7lCvM5zpq0a3YtNlAumoZQidpl8RqW6Hsass=;
        b=FFeHzEZulJS3zPQuwYaPqJGlX2QfHZ24K787gv7Q+ntjVP6olsEJ0/dDFS2P6S71aTgC4Q
        K2s4ngu4chq5zQwPiFmQ9sGfRI4CUJPHWSksFVqmJ5QJfr/qDpOyJgk9qDtC2uVdmN055c
        zHmJVnPftnOaf/QoY8bSoJhns96nFn0=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-270-bzYypFyIOeijCjK4KfaddQ-1; Tue, 27 Dec 2022 02:22:04 -0500
X-MC-Unique: bzYypFyIOeijCjK4KfaddQ-1
Received: by mail-wr1-f70.google.com with SMTP id h10-20020adfaa8a000000b0024208cf285eso1690327wrc.22
        for <linux-i2c@vger.kernel.org>; Mon, 26 Dec 2022 23:22:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zfKUWZq7lCvM5zpq0a3YtNlAumoZQidpl8RqW6Hsass=;
        b=t1fhmnyk1L72F1h7tHoyroal05xzobj0WB02ErAQ40ktGH03EL4bpgFRR+2q4aV2sK
         5Zm8T/kVS9qNgpoLWxy0g8oOJUSM9hViRXVHz7HAT8QoNaTlual+m/j+dbGLa+tZzkEJ
         pQhXqd2W7dZwXRz47xj/+Z7ofyVpkHjfTWu/f90VQ80iIMUwdGhLz98xOlETst3EJodt
         go+bXQyxUxq8VeOfQN3y2/q6CE5cEk0jq6oD3bczVMa9ktJpFmhWTrt4DuONhXpUrZKk
         jm9Bdr9GsUazwaZm3nSnXnxqiQBMYjQ294DqOAix+a6rmpP0qlmSvIS/PwrR7TdkhDHM
         KxFw==
X-Gm-Message-State: AFqh2kpJ2sSjLW7qi3ZrkiQEXhVQaHPWI8fjh6x7PWrzFsSYC+fqkT7P
        gOWOhhJsrXXAOexsMMcJoZjOekDXquvAMGeb/9R4G9ZCeABV33h2JhmDoi+IVmduKbpp/tr5ziM
        u6x9NGdz4XaJvgGNdstpM
X-Received: by 2002:a05:600c:1e11:b0:3d2:26e1:bd45 with SMTP id ay17-20020a05600c1e1100b003d226e1bd45mr18912019wmb.29.1672125723570;
        Mon, 26 Dec 2022 23:22:03 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtwhWF3hOB+CfPMNbqAWtPqmXhnEhLYXElqDaRnAVfaIXYN2fR1+P4H6eVMgRzb2KIsN1XyWg==
X-Received: by 2002:a05:600c:1e11:b0:3d2:26e1:bd45 with SMTP id ay17-20020a05600c1e1100b003d226e1bd45mr18912007wmb.29.1672125723386;
        Mon, 26 Dec 2022 23:22:03 -0800 (PST)
Received: from redhat.com ([2.52.151.85])
        by smtp.gmail.com with ESMTPSA id y24-20020a05600c365800b003cf894dbc4fsm16018925wmq.25.2022.12.26.23.22.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Dec 2022 23:22:03 -0800 (PST)
Date:   Tue, 27 Dec 2022 02:21:59 -0500
From:   "Michael S. Tsirkin" <mst@redhat.com>
To:     "Chen, Jian Jun" <jian.jun.chen@intel.com>
Cc:     Wolfram Sang <wsa@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>, asowang@redhat.com,
        Conghui <conghui.chen@intel.com>, linux-i2c@vger.kernel.org,
        virtualization@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MAINTAINERS: Update maintainer list for virtio i2c
Message-ID: <20221227022149-mutt-send-email-mst@kernel.org>
References: <20221214053631.3225164-1-conghui.chen@intel.com>
 <20221214063107.fazrfq3n26hw4ndl@vireshk-i7>
 <Y5mjcuCRP45ynJis@shikoro>
 <20221214065856-mutt-send-email-mst@kernel.org>
 <fd9bc91a-8afe-9dac-7d1f-2e57e658d2d7@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fd9bc91a-8afe-9dac-7d1f-2e57e658d2d7@intel.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Dec 27, 2022 at 12:05:09PM +0800, Chen, Jian Jun wrote:
> 
> On 12/14/2022 20:00, Michael S. Tsirkin wrote:
> > On Wed, Dec 14, 2022 at 11:20:34AM +0100, Wolfram Sang wrote:
> > > Hi Viresh,
> > > 
> > > > I understand that it is okay to pass the maintainership, within the
> > > > company, for platform specific parts from one person to another, since
> > > > they have the best knowledge of the code and are the only one
> > > > interested in maintaining it too.
> > > > 
> > > > But what is the rule for generic drivers like this one ?
> > > Dunno if this is really a rule, but if a maintainer steps out and makes
> > > sure there is someone to pick up the work, this is more than welcome.
> > > Way better than a stale entry in the MAINTAINERS file.
> > > 
> > > I mean, it does not limit the chance to have further maintainers, for
> > > example. I believe in meritocracy here. Those who do and collaborate,
> > > shall get responsibility.
> > Exactly. I'd like to see Jian Jun Chen do and collaborate first.
> 
> Hi Michael,
> 
> Sure, I will start to collaborate first.

Great!

> > > If not, then not. We can fix this, too, if
> > > needed.
> > > 
> > > What is the reason for your question?
> > > 
> > > All the best,
> > > 
> > >     Wolfram
> > > 
> > 

