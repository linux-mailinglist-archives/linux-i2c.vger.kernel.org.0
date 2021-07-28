Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B04073D8B14
	for <lists+linux-i2c@lfdr.de>; Wed, 28 Jul 2021 11:47:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231665AbhG1Jrx (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 28 Jul 2021 05:47:53 -0400
Received: from mail.kernel.org ([198.145.29.99]:54178 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231443AbhG1Jrw (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 28 Jul 2021 05:47:52 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 426CE60F9C;
        Wed, 28 Jul 2021 09:47:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1627465671;
        bh=6hpI4gRiWIN0fd0eWFY8c/aNxVDe6Fb04bV/5DieHMs=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=JgaXlVJV2SOl/SVyqvfOTu0cWCNbQrfGWwba3ODmZcza6w2FBsYKR8xlCwRWSymFj
         GJgz7B2Lcp5HGYOiWPmNc77VyyjkaeOXKKrw86tjUt9PbptZJKDqRnqtaBy0bhqmmB
         HwsHRYxJL0icYO1q5yXxVxWQrZUPsfLFrLTFH50hhTrx1pe5oGtcZL96IKS2QD8FeM
         WMON57/gMMQhxFRXYxCaxTM4cyMhACw2MgyOIbIn0QiYkXuAtaBY/YdqX0irVnxKYy
         9STYGblZeWjZVL4/w86X0VUEOMjuTwnAUlwaDTOY3qs0HOvq12urkRr1IvDz0uTXWI
         m5DjaPuorxsQA==
Date:   Wed, 28 Jul 2021 11:47:48 +0200 (CEST)
From:   Jiri Kosina <jikos@kernel.org>
To:     Michael Zaidman <michael.zaidman@gmail.com>
cc:     benjamin.tissoires@redhat.com, aaron.jones@ftdichip.com,
        linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
        linux-i2c@vger.kernel.org
Subject: Re: [PATCH v1] HID: ft260: fix device removal due to USB
 disconnect
In-Reply-To: <20210720144954.5392-1-michael.zaidman@gmail.com>
Message-ID: <nycvar.YFH.7.76.2107281147160.8253@cbobk.fhfr.pm>
References: <20210720144954.5392-1-michael.zaidman@gmail.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, 20 Jul 2021, Michael Zaidman wrote:

> This commit fixes a regression introduced by the commit 82f09a637dd3
> ("HID: ft260: improve error handling of ft260_hid_feature_report_get()")
> when upon USB disconnect, the ft260 i2c device is still available within
> the /dev folder.

Thanks for the fix. Could you please make the changelog a little bit more 
verbose though? Namely describe the issue in the code the patch is fixing 
(and how). Thanks,

-- 
Jiri Kosina
SUSE Labs

