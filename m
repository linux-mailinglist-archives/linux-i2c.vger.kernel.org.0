Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8F7B76D28B0
	for <lists+linux-i2c@lfdr.de>; Fri, 31 Mar 2023 21:32:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232007AbjCaTcw (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 31 Mar 2023 15:32:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57010 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230239AbjCaTcv (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 31 Mar 2023 15:32:51 -0400
Received: from mail-ua1-x932.google.com (mail-ua1-x932.google.com [IPv6:2607:f8b0:4864:20::932])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C30C320D92
        for <linux-i2c@vger.kernel.org>; Fri, 31 Mar 2023 12:32:50 -0700 (PDT)
Received: by mail-ua1-x932.google.com with SMTP id r7so16927221uaj.2
        for <linux-i2c@vger.kernel.org>; Fri, 31 Mar 2023 12:32:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1680291170; x=1682883170;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=nkeRp6lZuw2oE9ccSgxZK71jO5cGE2tSZwW3ZkFdEqk=;
        b=m3IBLZa+ndp/XP6VTlHC0Z0qaCgQPPAZlf+XIYXDNU9Cqt14GgnHX9h8SyocTL72zl
         oZ78zyghLjaUSzp6dPLwYaswE1pbvBBHdG3DAs/xjAeXA93HB++5vSxviMfe59u6LF05
         fIuX4t7toS4Orpt04PnldDu+e5eEHmF9IcCzM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680291170; x=1682883170;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nkeRp6lZuw2oE9ccSgxZK71jO5cGE2tSZwW3ZkFdEqk=;
        b=1vRfHLOhEgQ3yZS4LiPATqnsHHI6CrZMMHOGfF20c8hRy5xWrsOF6sMFy8jUyGuNac
         3CPcZGhYDzJX3vYq4MPqc94kAOTVYlYD5AqTZTBBHu1LR7ECILPOwel0xA02DqbFthaA
         5953U69TFqo0E14BEr+aBAabSaxJTQ5YAKplQH2tuQCcvU2xQXm76r3ZF+cHd2KptVi1
         LXwLGY7qKRwN+nt6Q/47mVP2thyGwXxlcBNFaQx4jz9SZm8L2vVPFB+oAed+/zU2ovnF
         AIsj319GUoCuYoamom7zHfKoJ1J0aH1NVcr0CjI/7+/T7MuOuLntGghoZdgB4zVwscIP
         HtLw==
X-Gm-Message-State: AAQBX9dXg/G4Z76vTfCyzdocTWgKxQJKfbKkbx5I/3/b4Ok9cMj5AAuF
        JBY3I3UPDjkE9/oN2SwAXQ+KOENiobUynK7ZlZOfNQ==
X-Google-Smtp-Source: AKy350aCMqdiaR6xYxKSn9tMLRmONsWM64BxlH+LLZQj0/CKeKknzAlNOi5D0DuvNE/izLqlao/Cg8+9jVYy0dWfX5o=
X-Received: by 2002:ab0:538c:0:b0:765:c202:f704 with SMTP id
 k12-20020ab0538c000000b00765c202f704mr7489403uaa.2.1680291169938; Fri, 31 Mar
 2023 12:32:49 -0700 (PDT)
MIME-Version: 1.0
References: <20230329220753.7741-1-mario.limonciello@amd.com>
 <20230329220753.7741-6-mario.limonciello@amd.com> <c298b247-1bdc-340c-ad7d-df3653cc9027@linux.intel.com>
 <CAOtMz3P5eCLZiQiPDs-iG6EdwLZHsNeEmSpPXFjJXcEBQ=retg@mail.gmail.com> <MN0PR12MB61014694E6D8BCD9E6E7152AE28F9@MN0PR12MB6101.namprd12.prod.outlook.com>
In-Reply-To: <MN0PR12MB61014694E6D8BCD9E6E7152AE28F9@MN0PR12MB6101.namprd12.prod.outlook.com>
From:   Mark Hasemeyer <markhas@chromium.org>
Date:   Fri, 31 Mar 2023 13:32:39 -0600
Message-ID: <CANg-bXDcYyPSkdOuAX8jWkyjh0chDfyXjGLW=wdZxOgoMdo=ig@mail.gmail.com>
Subject: Re: [PATCH v7 5/6] i2c: designware: Use PCI PSP driver for communication
To:     "Limonciello, Mario" <Mario.Limonciello@amd.com>
Cc:     =?UTF-8?B?SmFuIETEhWJyb8Wb?= <jsd@semihalf.com>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Grzegorz Bernacki <gjb@semihalf.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        "Held, Felix" <Felix.Held@amd.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Reviewed-by: Mark Hasemeyer <markhas@chromium.org>
