Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7C3F7280F68
	for <lists+linux-i2c@lfdr.de>; Fri,  2 Oct 2020 11:02:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726176AbgJBJC5 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 2 Oct 2020 05:02:57 -0400
Received: from mail.kernel.org ([198.145.29.99]:37336 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725993AbgJBJC5 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 2 Oct 2020 05:02:57 -0400
Received: from coco.lan (ip5f5ad59f.dynamic.kabel-deutschland.de [95.90.213.159])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 3D703205F4;
        Fri,  2 Oct 2020 09:02:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1601629376;
        bh=q3ZsyOwYHRvtoOzzzbVMlQ7DB4n703Yb+gNdOEACMic=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=Qq4zBYg0uK3s8DoZcHdoH9NLeMYyAS1MUm+kxQTtOtTXhN7QRjkqdnmko/XCdtvZB
         ALjLw0Z1kxqu6YX+PMMrVk4pLU0hqFt1WO2S/aUUFWX2M6pJDqcoeRUqcFn/9JAuRL
         VXObPs4Hr0IQ79uNsUBDDn8XewA39Cvq0B2ye3uc=
Date:   Fri, 2 Oct 2020 11:02:51 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Wolfram Sang <wsa@kernel.org>
Cc:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Balbir Singh <sblbir@amazon.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/6] docs: i2c: index.rst: add
 slave-testunit-backend.rst
Message-ID: <20201002110251.26265b0d@coco.lan>
In-Reply-To: <20201002075404.GA2495@ninjato>
References: <cover.1601616399.git.mchehab+huawei@kernel.org>
        <2ac6bd9d96cc4ff248d1c2e26a99f51a785eb271.1601616399.git.mchehab+huawei@kernel.org>
        <20201002075404.GA2495@ninjato>
X-Mailer: Claws Mail 3.17.6 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Em Fri, 2 Oct 2020 09:54:04 +0200
Wolfram Sang <wsa@kernel.org> escreveu:

> Hi Mauro,
> 
> > index 8a2ad3845191..9b8df313902c 100644
> > --- a/Documentation/i2c/index.rst
> > +++ b/Documentation/i2c/index.rst
> > @@ -38,6 +38,7 @@ Debugging
> >  
> >     gpio-fault-injection
> >     i2c-stub
> > +   slave-testunit-backend  
> 
> Yeah, it is missing, but this is the wrong paragraph to add it. For
> consistency, I'd like to create a seperate patch to fix it and merge it
> via I2C. Do you mind dropping this hunk?

Yeah, sure!

> I'd credit you with
> Reported-by, of course.

Thanks,
Mauro
