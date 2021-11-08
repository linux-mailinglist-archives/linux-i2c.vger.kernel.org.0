Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 82BA9449C14
	for <lists+linux-i2c@lfdr.de>; Mon,  8 Nov 2021 19:58:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236497AbhKHTBN (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 8 Nov 2021 14:01:13 -0500
Received: from mail.kernel.org ([198.145.29.99]:51780 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236467AbhKHTBJ (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 8 Nov 2021 14:01:09 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7A38961152;
        Mon,  8 Nov 2021 18:58:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1636397904;
        bh=KTojuwQ+u0LsjQAtF2ct0kbvBsFwwPUwlxlX0N1dF4c=;
        h=Date:From:To:Cc:Subject:In-Reply-To:From;
        b=HMEnexM91tUxmTTWU9mOYe7LOf9kHOcb6xVQVZxqKcG6YkobwaNlsbJAYkd6QBpc+
         CAskT3K9aXmCgZXWGDRLvI85cMuNFBv89xzeEEt+9D3wjEwuxVP+6lGsMOxNAwNurj
         Etegis5PM1qa7HCCuY1VxgcJ7Z8fRJX6LFJX7Z/ihaVBD3Jw9FQYbdaOCAsfSS4wq9
         6NvbVAC/Jmub2l4SOokA+mtUIUGFAD8QXM6f3QvnIWS6uFT6bfLXjCGpyZY6fdwIcS
         2cX7E15IRuRsXL/HPV6VfHzoTdCgE6TkgnLnkp4bjLLjrzj7FcWkc4sYfnAlR8tPhh
         X/ypGPWsddldQ==
Date:   Mon, 8 Nov 2021 12:58:23 -0600
From:   Bjorn Helgaas <helgaas@kernel.org>
To:     Robert =?utf-8?B?xZp3acSZY2tp?= <robert@swiecki.net>,
        Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     linux-i2c@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>,
        linux-pci@vger.kernel.org, "Rafael J. Wysocki" <rafael@kernel.org>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: Crashes in 5.15-git in i2c code
Message-ID: <20211108185823.GA1101310@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAP145phj7jEy6tkdFMdW-rzPprMTUckaaSrtrVysE-u+S+=Lcg@mail.gmail.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

[+cc Uwe, Rafael, linux-pm, linux-pci, linux-kernel, beginning of
thread: https://lore.kernel.org/linux-i2c/CAP145pgdrdiMAT7=-iB1DMgA7t_bMqTcJL4N0=6u8kNY3EU0dw@mail.gmail.com/T/#t]

On Mon, Nov 08, 2021 at 05:34:14PM +0100, Robert Święcki wrote:
> > I'm daily-driving the linux from Linus' git (recompiling every day or
> > two), and yesterday it stopped booting. Below is the dmesg from
> > pstore.
> > ...
> 
> This introduced the bug: 0c5c62ddf88c34bc83b66e4ac9beb2bb0e1887d4
> https://github.com/torvalds/linux/commit/0c5c62ddf88c34bc83b66e4ac9beb2bb0e1887d4

Thank you very much for the debugging and this report!  This report is
for i2c, but the problem will affect many drivers.

> > <1>[    1.431369][  T447] BUG: kernel NULL pointer dereference,
> > address: 0000000000000540
> > <1>[    1.431371][  T447] #PF: supervisor read access in kernel mode
> > <1>[    1.431375][  T447] #PF: error_code(0x0000) - not-present page
> > <6>[    1.431378][  T447] PGD 0 P4D 0
> > <4>[    1.431384][  T447] Oops: 0000 [#1] PREEMPT SMP NOPTI
> > <4>[    1.431388][  T447] CPU: 12 PID: 447 Comm: systemd-udevd
> > Tainted: G            E     5.15.0+ #91
> > <4>[    1.431391][  T447] Hardware name: ASUS System Product Name/ROG
> > CROSSHAIR VIII FORMULA, BIOS 3801 07/30/2021
> > <4>[    1.431392][  T447] RIP: 0010:i2c_dw_pci_resume+0x8/0x40
> > [i2c_designware_pci]
> > <4>[    1.431399][  T447] Code: 00 00 00 00 66 66 2e 0f 1f 84 00 00 00
> > 00 00 66 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 84 00 00 00 00 00 53 48
> > 8b 5f 78 48 89 df <ff> 93 40 05 00 00 c6 83 c0 05 00 00 00 5b c3 66 66
> > 2e 0f 1f 84 00
> > <4>[    1.431401][  T447] RSP: 0018:ffffb3e740a13ba8 EFLAGS: 00010286
> > <4>[    1.431403][  T447] RAX: 0000000000000000 RBX: 0000000000000000
> > RCX: 0000000000000000

  $ ./scripts/decodecode < oops
    22:       53                      push   %rbx
    23:       48 8b 5f 78             mov    0x78(%rdi),%rbx
    27:       48 89 df                mov    %rbx,%rdi
    2a:*      ff 93 40 05 00 00       callq  *0x540(%rbx)             <-- trapping instruction
    30:       c6 83 c0 05 00 00 00    movb   $0x0,0x5c0(%rbx)
    37:       5b                      pop    %rbx
    38:       c3                      retq

  static int i2c_dw_pci_resume(struct device *dev)
  {
    struct dw_i2c_dev *i_dev = dev_get_drvdata(dev);
    int ret;

    ret = i_dev->init(i_dev);
    i_dev->suspended = false;

    return ret;

So I think we're trying to call i_dev->init(), which is a NULL
pointer.

> > <4>[    1.431422][  T447]  pci_pm_runtime_resume+0xaa/0x100
> > <4>[    1.431434][  T447]  __rpm_callback+0x3c/0x100
> > <4>[    1.431442][  T447]  rpm_callback+0x54/0x80
> > <4>[    1.431445][  T447]  rpm_resume+0x410/0x700
> > <4>[    1.431455][  T447]  __pm_runtime_resume+0x45/0x80
> > <4>[    1.431457][  T447]  pci_device_probe+0xa2/0x140
> > <4>[    1.431459][  T447]  really_probe+0x1e4/0x400
> > <4>[    1.431464][  T447]  __driver_probe_device+0xf9/0x180
> > <4>[    1.431466][  T447]  driver_probe_device+0x19/0xc0

I think the problem here is that:

  - really_probe() sets dev->driver

  - local_pci_probe() calls pm_runtime_get_sync(), which leads to:

  - pci_pm_runtime_resume(), which previously skipped the driver's
    .runtime_resume() method when "pci_dev->driver" as NULL

  - after 2a4d9408c9e8 ("PCI: Use to_pci_driver() instead of
    pci_dev->driver") [1], it checks "dev->driver" instead of
    "pci_dev->driver"

  - dev->driver is non-NULL (set by really_probe() above), but at this
    point pci_dev->driver used to be NULL because local_pci_probe()
    didn't set it until after after calling pm_runtime_get_sync() (see
    b5f9c644eb1b ("PCI: Remove struct pci_dev->driver") [2])

  - because dev->driver is non-NULL, we call i2c_dw_pci_resume()
    before i2c_dw_pci_probe(), so the driver init hasn't been done

Here's the call tree:

    really_probe
      dev->driver = drv;                       # <--
      call_driver_probe
        dev->bus->probe
          pci_device_probe
            __pci_device_probe
              pci_call_probe
                local_pci_probe
                  pm_runtime_get_sync
                    ...
                    pci_pm_runtime_resume
  -                   if (!pci_dev->driver)    # 2a4d9408c9e8 ("PCI: Use to_pci_driver() instead of pci_dev->driver")
  +                   if (!to_pci_driver(dev->driver))
                        return 0
                      pm->runtime_resume
                        i2c_dw_pci_resume
                          i_dev->init()        # <-- NULL ptr deref
  -                 pci_dev->driver = pci_drv  # b5f9c644eb1b ("PCI: Remove struct pci_dev->driver")
                  pci_drv->probe
                    i2c_dw_pci_probe

Note that we used to call pm_runtime_get_sync() (and the driver's
runtime_resume() method) in the window where dev->driver had been set
but pci_dev->driver had not.  Since we got rid of pci_dev->driver
altogether, that window no longer exists, so we call the driver's
runtime_resume() when it isn't prepared for it.

[1] https://git.kernel.org/linus/2a4d9408c9e8
[2] https://git.kernel.org/linus/b5f9c644eb1b
