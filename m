Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AA26E7095F3
	for <lists+linux-i2c@lfdr.de>; Fri, 19 May 2023 13:06:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231974AbjESLGf (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 19 May 2023 07:06:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48300 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231553AbjESLGd (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 19 May 2023 07:06:33 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 53E2C10F9
        for <linux-i2c@vger.kernel.org>; Fri, 19 May 2023 04:06:08 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 0B397656BA
        for <linux-i2c@vger.kernel.org>; Fri, 19 May 2023 11:05:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED55AC433D2;
        Fri, 19 May 2023 11:05:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1684494327;
        bh=cTK73c+M1aoGMVEUoIIv0E9bhWzbeH/CU9rCyS+n/Rg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=cemNV6YpLApLKd6r9Kh60Y6e/qyYXtH4FVweHLJrZj69W7knF3ryLXJ/IucjN0+Tw
         +Yg6aVKh6iNooZbfDlvCPwCWW4cfhuRzFmeJc83XMUhDq4IIJpmRJmqgnsplj+1pY1
         rBuxaEfyRDvdH9aei46tOKFUqmbqe6wr/K0mWQKM06WtxRBdpGwFOATdY2gSyvLmnG
         HS78Co8dtnBXdZ+jQY/aqluw5w9TQjvHKVvODGSsDO7YrlvUZT2o51KTx4SxLeFTd9
         qla2IEd8Ijwwy9byVQP7bjDW7TMJ87RZ23Sp3TCXKVAtVt8QEHpwJNlH8WgNShvjUQ
         bSHn/wYstZ63Q==
Date:   Fri, 19 May 2023 13:05:24 +0200
From:   Andi Shyti <andi.shyti@kernel.org>
To:     Jarkko Nikula <jarkko.nikula@linux.intel.com>
Cc:     linux-i2c@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
        Wolfram Sang <wsa@kernel.org>
Subject: Re: [PATCH v3 1/3] i2c: i801: Enlarge device name field in i801_ids
 table
Message-ID: <20230519110524.kyhlbztont2koerk@intel.intel>
References: <20230512115001.81309-1-jarkko.nikula@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230512115001.81309-1-jarkko.nikula@linux.intel.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Jarkko,

On Fri, May 12, 2023 at 02:49:59PM +0300, Jarkko Nikula wrote:
> Indent data field in the i801_ids table by one tab to make more space for
> longer device names.
> 
> Signed-off-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>

Reviewed-by: Andi Shyti <andi.shyti@kernel.org> 

Andi
