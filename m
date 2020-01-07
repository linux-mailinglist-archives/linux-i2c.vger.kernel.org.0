Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4616D132F94
	for <lists+linux-i2c@lfdr.de>; Tue,  7 Jan 2020 20:36:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728358AbgAGTgw (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 7 Jan 2020 14:36:52 -0500
Received: from vps0.lunn.ch ([185.16.172.187]:51248 "EHLO vps0.lunn.ch"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728307AbgAGTgw (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 7 Jan 2020 14:36:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
        s=20171124; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
        Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=Cbzy/2bT/fLLUdqy1XbXJMyT5+sZqroDJ+qaO7iOoDQ=; b=5MWuoqtpIMjkxFSxJ2AZ7hyLWY
        naafxz1L8XCn2B5uye60IPjP7OW46wEIMpB1mIVBcXJz2SJELp1UnaQ6po9lZ9IwnZFMFCEXyxyHM
        mjsJVjcB5SYgFUknDexOlmWggXFJ0akFS7pHx5JnXWMyEW5XeK1mopga9VCE4SgBAnWc=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.93)
        (envelope-from <andrew@lunn.ch>)
        id 1iouel-0004bC-7Y; Tue, 07 Jan 2020 20:36:47 +0100
Date:   Tue, 7 Jan 2020 20:36:47 +0100
From:   Andrew Lunn <andrew@lunn.ch>
To:     Peter Korsgaard <peter@korsgaard.com>
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 04/12] i2c: ocores: convert to use i2c_new_client_device()
Message-ID: <20200107193647.GA16895@lunn.ch>
References: <20200107174748.9616-1-wsa+renesas@sang-engineering.com>
 <20200107174748.9616-5-wsa+renesas@sang-engineering.com>
 <87muazjewd.fsf@dell.be.48ers.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87muazjewd.fsf@dell.be.48ers.dk>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Jan 07, 2020 at 07:32:50PM +0100, Peter Korsgaard wrote:
> >>>>> "Wolfram" == Wolfram Sang <wsa+renesas@sang-engineering.com> writes:
> 
>  > Move away from the deprecated API and return the shiny new ERRPTR where
>  > useful.
> 
>  > Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> 
> I didn't follow the discussion, but I don't see any returns anywhere?

Hi Peter

I have also not been following the discussion. But i2c_new_device()
seems to of always returned a NULL pointer on error, and the code has
been ignoring it. The 'where useful' comment suggests the return value
maybe checked, but it is optional to check it.  So this patch seems
O.K.

I suppose the commit message could be extended with:

In this case, the shiny new stuff is not useful, so ignore it.

But:

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew
