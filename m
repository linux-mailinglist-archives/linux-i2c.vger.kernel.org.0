Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 07CB04DDB17
	for <lists+linux-i2c@lfdr.de>; Fri, 18 Mar 2022 14:58:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236933AbiCRN7k (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 18 Mar 2022 09:59:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43326 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230256AbiCRN7j (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 18 Mar 2022 09:59:39 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D1801D9EAB;
        Fri, 18 Mar 2022 06:58:20 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 308B3619FC;
        Fri, 18 Mar 2022 13:58:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB53FC340EC;
        Fri, 18 Mar 2022 13:58:18 +0000 (UTC)
Date:   Fri, 18 Mar 2022 09:58:17 -0400
From:   Steven Rostedt <rostedt@goodmis.org>
To:     Wolfram Sang <wsa@kernel.org>
Cc:     Jae Hyun Yoo <quic_jaehyoo@quicinc.com>,
        Ingo Molnar <mingo@redhat.com>,
        Jamie Iles <quic_jiles@quicinc.com>,
        Graeme Gregory <quic_ggregory@quicinc.com>,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
Subject: Re: [PATCH v2] i2c: add tracepoints for I2C slave events
Message-ID: <20220318095817.4ad3a65a@gandalf.local.home>
In-Reply-To: <YjRkvPc9uahbozbQ@shikoro>
References: <20220308163333.3985974-1-quic_jaehyoo@quicinc.com>
        <YjRkvPc9uahbozbQ@shikoro>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, 18 Mar 2022 11:53:48 +0100
Wolfram Sang <wsa@kernel.org> wrote:


> > trace printings can be selected by adding a filter like:
> > 
> > 	echo adapter_nr==1 >/sys/kernel/tracing/events/i2c_slave/filter
> > 
> > Signed-off-by: Jae Hyun Yoo <quic_jaehyoo@quicinc.com>  
> 
> Steven, are you happy with the tracepoint parts of this patch?

Strange. I do not have v2 in my inbox anywhere. I checked the spam folders
and found nothing. I had a glitch in my mail server around this time and
maybe it was dropped then.

Let me take a look at it in my LMKL folder, which it appears to be there :-/

-- Steve


> 
> 
> > +	if (trace_i2c_slave_enabled() && !ret)
> > +		trace_i2c_slave(client, event, val);  
> 
> Why '!ret'? I think we should always print 'ret' in the trace as well.
> Backends are allowed to send errnos on WRITE_RECEIVED to NACK the
> reception of a byte. This is useful information, too, or?
> 
> Rest looks good to me.
> 
> Thanks,
> 
>    Wolfram
> 

