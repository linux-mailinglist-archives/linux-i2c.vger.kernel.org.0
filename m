Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 237B84332B6
	for <lists+linux-i2c@lfdr.de>; Tue, 19 Oct 2021 11:42:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234914AbhJSJoV (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 19 Oct 2021 05:44:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54924 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234680AbhJSJoS (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 19 Oct 2021 05:44:18 -0400
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com [IPv6:2607:f8b0:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2EF2CC06161C
        for <linux-i2c@vger.kernel.org>; Tue, 19 Oct 2021 02:42:06 -0700 (PDT)
Received: by mail-pf1-x42d.google.com with SMTP id o133so17117575pfg.7
        for <linux-i2c@vger.kernel.org>; Tue, 19 Oct 2021 02:42:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=ZObreM2oofTkM3qJIYvGBPc4dPhqrsVSh4sl9pXqX94=;
        b=gvXmPjPnRSNvISobWg1zZ6bO0AluECpeMJn/Wtis+JgxiwNWlke4JGvx/mqVLqczl8
         4jegSqD2RFGK0e+025gFJmGB8Qvce8i7b/zZvQ5P1o4tLw1CzTJCwwCocqUq7fuHZO+p
         MysEs4HafXErdZiKjnpU0yu+cum9rB5wSlO9OOgu1EapetCEmzj0NnS7gBq21lAK4Hmb
         us2FlYi0wzPlsPFN+EMKrExs6+LEEyUnmsxebLREjpYBNZbdZXV2nC9luLFkNAXb785e
         VKs72+TSrOMuYyZ1MUsqyan//oK3gDLuHtSMWLNH5V4uXwMqvV5oIPkyMVN3VdplB57K
         d2Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=ZObreM2oofTkM3qJIYvGBPc4dPhqrsVSh4sl9pXqX94=;
        b=pYYezQz6dNW9G/ByT9B6jXaDAe1SMPYSNTSmlzW5bd34rd1KH/BeOoJPPsJocu+gMU
         pcZavoaAfc9XiMDcBwY8tPGAN1tKZQ308KVhVqCqX30rq5s3wdQ0lvaf08H8vzz3IXbr
         EjCcFiZfofVSbAoosf5hcvf8xEj21Kl1BgajZqo+ofY8NIIqgr+TBU+biW2anJMcbOQ3
         otUTnVwL5Bf42X/iZIrDq5l4mLn4Du4v58g4GVROR1TJg6MextwX8gs5aEgnpZwyI3em
         mb0ETJNroLA4EcEcJj+RdFXhcOtKt59LkN2MWhkeKrVCzKQ4J/ewJo99cTLOl54trXjP
         9pkQ==
X-Gm-Message-State: AOAM530LAFRgI7nct1GID/L+lCEVw6CuB0NP+kUVvr8HgjZ2ekySKuT5
        I6XM06ltstzn7citkW/UPv/b2A==
X-Google-Smtp-Source: ABdhPJxcbC3OBgUMO+Lzh3jDx/hudBuFmrzaHwnRyTDEgDNQv+z9BMlhRENFVRvc+ZiQhDZAdCws7A==
X-Received: by 2002:a63:154:: with SMTP id 81mr27360406pgb.38.1634636525679;
        Tue, 19 Oct 2021 02:42:05 -0700 (PDT)
Received: from localhost ([106.201.113.61])
        by smtp.gmail.com with ESMTPSA id u4sm2037379pjg.54.2021.10.19.02.42.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Oct 2021 02:42:05 -0700 (PDT)
Date:   Tue, 19 Oct 2021 15:12:03 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     Vincent Whitchurch <vincent.whitchurch@axis.com>, wsa@kernel.org,
        jie.deng@intel.com, virtualization@lists.linux-foundation.org,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel@axis.com
Subject: Re: [PATCH 1/2] i2c: virtio: disable timeout handling
Message-ID: <20211019094203.3kjzch7ipbdv7peg@vireshk-i7>
References: <20211019074647.19061-1-vincent.whitchurch@axis.com>
 <20211019074647.19061-2-vincent.whitchurch@axis.com>
 <20211019080913.oajrvr2msz5enzvz@vireshk-i7>
 <YW6Rj/T6dWfMf7lU@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YW6Rj/T6dWfMf7lU@kroah.com>
User-Agent: NeoMutt/20180716-391-311a52
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 19-10-21, 11:36, Greg KH wrote:
> What is the "other side" here?  Is it something that you trust or not?

Other side can be a remote processor (for remoteproc over virtio or
something similar), or traditionally it can be host OS or host
firmware providing virtualisation to a Guest running Linux (this
driver). Or something else..

I would incline towards "we trust the other side" here.

> Usually we trust the hardware, but if you do not trust the hardware,
> then yes, you need to have a timeout here.

The other side is the software that has access to the _Real_ hardware,
and so we should trust it. So we can have a actually have a completion
without timeout here, interesting.

-- 
viresh
