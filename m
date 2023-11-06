Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 54BBA7E2495
	for <lists+linux-i2c@lfdr.de>; Mon,  6 Nov 2023 14:23:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232301AbjKFNXY (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 6 Nov 2023 08:23:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60890 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232489AbjKFNXV (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 6 Nov 2023 08:23:21 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 97C43D4C
        for <linux-i2c@vger.kernel.org>; Mon,  6 Nov 2023 05:23:17 -0800 (PST)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1CD2AC433C9;
        Mon,  6 Nov 2023 13:23:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1699276997;
        bh=ZihjVkaZGbT4Oi+vZJEZ6rVvzvbcSVOyo2ZMVM7taAg=;
        h=Date:From:To:Subject:From;
        b=PSSDZlWeg2eHtT/QV334o90NgVdNsiXU4+TBKnjtLCrHGoZhJAjNzaO0npq7PzO6a
         Eot1QjUQk8NSp5K+Y6iCv9IZyPsoalnytl/ChSAIZ+qYc7AqpsA/V8kuyU8wrTZ/Lc
         10HFUZXjIlvhqiUpQwKGpV2x/EZ9ncC4tfjanszE=
Date:   Mon, 6 Nov 2023 08:23:16 -0500
From:   Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To:     linux-i2c@vger.kernel.org
Subject: PSA: migrating linux-i2c to new vger infrastructure
Message-ID: <20231106-sweet-heavy-booby-a00a52@nitro>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Good day!

I plan to migrate the linux-i2c@vger.kernel.org list to the new infrastructure
this week. We're still doing it list-by-list to make sure that we don't run
into scaling issues with the new infra.

The migration will be performed live and should not require any downtime.
There will be no changes to how anyone interacts with the list after
migration is completed, so no action is required on anyone's part.

Please let me know if you have any concerns.

Best wishes,
-K
