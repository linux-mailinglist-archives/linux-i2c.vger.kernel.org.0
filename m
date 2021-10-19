Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6B77743382C
	for <lists+linux-i2c@lfdr.de>; Tue, 19 Oct 2021 16:14:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233040AbhJSOQt (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 19 Oct 2021 10:16:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33050 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233052AbhJSOQm (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 19 Oct 2021 10:16:42 -0400
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com [IPv6:2607:f8b0:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CE172C061746
        for <linux-i2c@vger.kernel.org>; Tue, 19 Oct 2021 07:14:28 -0700 (PDT)
Received: by mail-pg1-x534.google.com with SMTP id t184so6493509pgd.8
        for <linux-i2c@vger.kernel.org>; Tue, 19 Oct 2021 07:14:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=P3aFOrAVMeW3dg7UCLDtwTav45B+vnA1U2f1FHY1ecE=;
        b=ZrLSbYqk6HwF2MKuP6JHZLFgt5odRZM70L6wgkOkxf1uXD5hcl5owFLK62YepQdmCt
         DSnRy9R7Bi14qXQJwG/Ji9ibgB1UA2bBIPNwivw/CmIeUoY6vS/y1AyBMKdPWQ4nRiKo
         924z3ClveLyp2M2nMvlfAWb/8YKLKtQWGhi+qtMi4SLp9+ha/sTmsPRp15OLNS4TU24T
         cq6d834UYoMaBaUckQ6loqWSBMsBz6fHpe1Z22IG+PtuPAuIUDPTFQZLUoP/DorHhW4t
         Tjf+ybUomO17JYBI/CelCQLOhCLvqfZsZRp1H5ptBUCFHIRM+cQiod1qQemW9Xbyw7/5
         N1iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=P3aFOrAVMeW3dg7UCLDtwTav45B+vnA1U2f1FHY1ecE=;
        b=LFLav4Kk7Vnz6Ew/IS92mH8mu1X2SJxPIknDRoDx4EZPfKlt8ui6Qxk0EoBuYZf/F2
         NRN7IC0Ekxgk+HydTBKb5Cl4Z/x6hfzkmCN3pICmWq4Yf0pV1PuTfjZ3d1+r4JHC6q9T
         DKBYzbe3qcNmtbe3ul3XvcjpEPG0R51qSCszAic0iEXf8iGP0UfELiIOKD6uOC8CiktG
         fsUpujZ9YZ24xGbrXwpYQE18RdtZdYbhHiw5jlF/HABpw92VJkaQ3pAV5aCw5LJHFS8j
         ejL0oLibLGYHabZHmd9u1JUYBWg9i6NguvtVqbu4z2F/VBRzPf3nGHEh5hoi9ExJ57yP
         pYag==
X-Gm-Message-State: AOAM533tLMeyLnbSbSbb4+DJfUdD2ce1UB+VZiu+kxnTCTQJIOV970mM
        D6VgSWYpb0Z5bRWdSeFyh+J5Mg==
X-Google-Smtp-Source: ABdhPJyOB1u4FJx3A72AZQFyFN/BxVUZq7/f7i2XVIE2wXvUpxFYNCvWwiJSasmViHMk3T5Y334d0Q==
X-Received: by 2002:aa7:9043:0:b0:44d:13c7:14a5 with SMTP id n3-20020aa79043000000b0044d13c714a5mr26622pfo.86.1634652868250;
        Tue, 19 Oct 2021 07:14:28 -0700 (PDT)
Received: from localhost ([106.201.113.61])
        by smtp.gmail.com with ESMTPSA id bp19sm2729404pjb.46.2021.10.19.07.14.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Oct 2021 07:14:27 -0700 (PDT)
Date:   Tue, 19 Oct 2021 19:44:24 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Wolfram Sang <wsa@kernel.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        Vincent Whitchurch <vincent.whitchurch@axis.com>,
        jie.deng@intel.com, virtualization@lists.linux-foundation.org,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel@axis.com
Subject: Re: [PATCH 1/2] i2c: virtio: disable timeout handling
Message-ID: <20211019141424.2lqc5cd5adiqffur@vireshk-i7>
References: <20211019074647.19061-1-vincent.whitchurch@axis.com>
 <20211019074647.19061-2-vincent.whitchurch@axis.com>
 <20211019080913.oajrvr2msz5enzvz@vireshk-i7>
 <YW6Rj/T6dWfMf7lU@kroah.com>
 <20211019094203.3kjzch7ipbdv7peg@vireshk-i7>
 <YW6owLxoYbxG5GxT@ninjato>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YW6owLxoYbxG5GxT@ninjato>
User-Agent: NeoMutt/20180716-391-311a52
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 19-10-21, 13:15, Wolfram Sang wrote:
> 
> > The other side is the software that has access to the _Real_ hardware,
> > and so we should trust it. So we can have a actually have a completion
> > without timeout here, interesting.
> 
> So, if the other side gets a timeout talking to the HW, then the timeout
> error will be propagated?

It should be, ideally :)

> If so, then we may live with plain wait_for_completion().

-- 
viresh
