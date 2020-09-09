Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1075A2631EA
	for <lists+linux-i2c@lfdr.de>; Wed,  9 Sep 2020 18:30:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731129AbgIIQ36 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 9 Sep 2020 12:29:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56370 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731126AbgIIQ1c (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 9 Sep 2020 12:27:32 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DAF70C0617A5;
        Wed,  9 Sep 2020 06:30:08 -0700 (PDT)
Received: by ozlabs.org (Postfix, from userid 1034)
        id 4BmjWR3xYDz9sVW; Wed,  9 Sep 2020 23:28:03 +1000 (AEST)
From:   Michael Ellerman <patch-notifications@ellerman.id.au>
To:     linuxppc-dev@lists.ozlabs.org, Stephen Kitt <steve@sk2.org>,
        Scott Wood <oss@buserror.net>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>
Cc:     linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
In-Reply-To: <20200807152713.381588-1-steve@sk2.org>
References: <20200807152713.381588-1-steve@sk2.org>
Subject: Re: [PATCH] arch/powerpc: use simple i2c probe function
Message-Id: <159965716684.808686.4339273777351365516.b4-ty@ellerman.id.au>
Date:   Wed,  9 Sep 2020 23:28:03 +1000 (AEST)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, 7 Aug 2020 17:27:13 +0200, Stephen Kitt wrote:
> The i2c probe functions here don't use the id information provided in
> their second argument, so the single-parameter i2c probe function
> ("probe_new") can be used instead.
> 
> This avoids scanning the identifier tables during probes.

Applied to powerpc/next.

[1/1] powerpc: Use simple i2c probe function
      https://git.kernel.org/powerpc/c/6c9100ea39d209e1625ba0fe06134192d9c4752a

cheers
