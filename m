Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 34F8A1DA673
	for <lists+linux-i2c@lfdr.de>; Wed, 20 May 2020 02:24:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728322AbgETAYj (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 19 May 2020 20:24:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37420 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728324AbgETAYi (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 19 May 2020 20:24:38 -0400
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B346DC061A0F;
        Tue, 19 May 2020 17:24:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
        Subject:Sender:Reply-To:Content-ID:Content-Description;
        bh=f4mJIO76w3QNaVC39x+y/UuJaWunNeSQRrsRFVGwnCc=; b=A+JO/ShT4rx5nGLcIntg3t/nkd
        UqfwxWaPUdvCDWPbfEywDHPQUyqt5TvhhSSMknnfUclaFZtgQYGrZsUQ0RB2qfXHrTaaq302i0azs
        zX8i7oH/g61MVbXwvXLcER/qfvE+F2avdB7lBKcWp/O5eUOyG3YufWCfPghw/24kTNflJWfvT8zZ5
        35k/TuN9/uVZVVtu7GcOhIytSHmpB6O9R6KmIo86rUa92byN0QQZC8hKDYpOiFdVK7Eya5ONXESuY
        mS3Fj9cdcW49NEKpACdcPfd/Us0Ka2JsB//Otr5GyTGPAbJkRHtC8rv9QNtjB+bhPmZ119lKuPC4f
        FalGFePQ==;
Received: from [2601:1c0:6280:3f0::19c2]
        by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1jbCXB-00059Y-6v; Wed, 20 May 2020 00:24:33 +0000
Subject: Re: linux-next: Tree for May 19 (i2c/busses/i2c-mt65xx.o)
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        wsa@kernel.org,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        Qii Wang <qii.wang@mediatek.com>
References: <20200520040354.3e619918@canb.auug.org.au>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <e7aa1258-6c54-03bd-3252-20cefe88b87d@infradead.org>
Date:   Tue, 19 May 2020 17:24:30 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200520040354.3e619918@canb.auug.org.au>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 5/19/20 11:03 AM, Stephen Rothwell wrote:
> Hi all,
> 
> News: there will be no linux-next release tomorrow.
> 
> Changes since 20200518:
> 

on i386:

ERROR: modpost: "__udivdi3" [drivers/i2c/busses/i2c-mt65xx.ko] undefined!
ERROR: modpost: "__divdi3" [drivers/i2c/busses/i2c-mt65xx.ko] undefined!


-- 
~Randy
Reported-by: Randy Dunlap <rdunlap@infradead.org>
