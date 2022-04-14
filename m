Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E40FD5008F2
	for <lists+linux-i2c@lfdr.de>; Thu, 14 Apr 2022 10:55:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240769AbiDNI6H (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 14 Apr 2022 04:58:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37568 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237997AbiDNI6H (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 14 Apr 2022 04:58:07 -0400
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9370965D24;
        Thu, 14 Apr 2022 01:55:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1649926543;
  x=1681462543;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=EKQ0yqkEdK1AucptjfCwr+qtiem+dTCzWK8vM9EwHXY=;
  b=P4ZNCc46Nr9gF/ml4sK0EFqnqBR2gdLjypk88I6GoOCU9AMQtELRXCxX
   4sVs9hEE5NaNp3ULGXpO8vs+y7M5rIbeL3lwI2ckGKHKmIxd5aQQdQoq9
   h3bsArq8QjuphTV61KD4kFfIl8HqigQqxH6u8DLO8dlDAiHQDrcBRjHo0
   omZnyIHvw5pWXqce6dAMZHPBPzaI5970yO+XAmNC4oczEdhTA3bWY9Zti
   dx4K95M19hiB8WmpUaxbwVtv1o/fowO5lJVaRLb5uFsrrNhw/r1GwkVJy
   O7dr7uXhBRB3S4LiPyJPTgRVNJoFvbgfzq0mvhLmN606ufr1qb3QD7pBl
   g==;
Date:   Thu, 14 Apr 2022 10:55:40 +0200
From:   Vincent Whitchurch <vincent.whitchurch@axis.com>
To:     Rob Herring <robh@kernel.org>
CC:     "wsa@kernel.org" <wsa@kernel.org>, kernel <kernel@axis.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: i2c: add property to avoid device
 detection
Message-ID: <20220414085539.GA7392@axis.com>
References: <20220412085046.1110127-1-vincent.whitchurch@axis.com>
 <20220412085046.1110127-2-vincent.whitchurch@axis.com>
 <YlXtobiXIyObF/7+@robh.at.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <YlXtobiXIyObF/7+@robh.at.kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Apr 12, 2022 at 11:22:41PM +0200, Rob Herring wrote:
> On Tue, Apr 12, 2022 at 10:50:45AM +0200, Vincent Whitchurch wrote:
> > diff --git a/Documentation/devicetree/bindings/i2c/i2c.txt b/Documentation/devicetree/bindings/i2c/i2c.txt
> > index fc3dd7ec0445..960d1d5c9362 100644
> > --- a/Documentation/devicetree/bindings/i2c/i2c.txt
> > +++ b/Documentation/devicetree/bindings/i2c/i2c.txt
> > @@ -72,6 +72,10 @@ wants to support one of the below features, it should adapt these bindings.
> >  	this information to adapt power management to keep the arbitration awake
> >  	all the time, for example. Can not be combined with 'single-master'.
> >  
> > +- no-detect
> > +	states that no other devices are present on this bus other than the
> > +	ones listed in the devicetree.
> 
> This belongs in the schema instead:
> 
> https://github.com/devicetree-org/dt-schema/blob/main/dtschema/schemas/i2c/i2c-controller.yaml

OK, thank you, I've sent a PR[0] now, but I must admit I don't quite
understand how this property differs from the other ones in this file
which aren't documented there.

[0] https://github.com/devicetree-org/dt-schema/pull/72
