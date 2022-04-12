Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 40A414FE4E3
	for <lists+linux-i2c@lfdr.de>; Tue, 12 Apr 2022 17:39:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242001AbiDLPlV (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 12 Apr 2022 11:41:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49492 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1357127AbiDLPlS (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 12 Apr 2022 11:41:18 -0400
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 83B605D660
        for <linux-i2c@vger.kernel.org>; Tue, 12 Apr 2022 08:38:59 -0700 (PDT)
Received: by mail-lj1-x232.google.com with SMTP id o16so18680107ljp.3
        for <linux-i2c@vger.kernel.org>; Tue, 12 Apr 2022 08:38:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=iLfNvE8CPnk4DiJZE04N/BfmAQVeqZk/x6ub8dyc9bY=;
        b=mM7xLKMT2hU/VpxTE/TO30yJZgwiMs4vL8/9xNJwBjAniUD8gMxH7F0pD1de6J0eAp
         2hB0ber12UsJdGNMqn49GUwVjRj1sbmfBtx1f3yPINhlJ6gAiKvfnOZURcyuDloKNGnf
         fBFYKiIZHe3cDyxDCO5JgAbAIj7ykN/zGqwH7lQa7C08KRR8YbpeFyg/GMKMcdFB/6sq
         6CxmUsSkuF0JBC7MbPD8IRwYOK3VFHwqusYO1Xf337kxhBptfo7H4GEfLjeyYzvKxBi6
         U96iYsTp9bz52BA5vJqeAcq5RyVDf2k3c8JdVXuxgscpNzhWe7TVH2/E223K3mKfuFJk
         5GPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=iLfNvE8CPnk4DiJZE04N/BfmAQVeqZk/x6ub8dyc9bY=;
        b=1Gblf4oHaKkVyBEDfYXz2JuQKb/uXN8i3al9Q1GMjeP2fCobrBoBcs8IEl3kBLw8P4
         3dPqamON9UU9Yy989K+zK99fa9N1BcZGKVUpDl93gTUyGl74vweCsPt5b6N/ljQGmzj6
         vsDeII8f5f5xoWbbgJfavkBqYTPWIQVrJoZuUvJ2+8X5NRB1Ob0oQ8vrGtd4xJDmG2pk
         hT8SSZ81X5VklVJphLIfzpXSvh/cX207WvWxZkg1xHvrb5ISS6HyAvkOqQc9jTm8f5bS
         C4DbCKIOVPtlMGqP09S85k6zHe2gmKJCOrTGiGiwofH8LGb4gTXn/76x2SuZ0ImDFkii
         NGzg==
X-Gm-Message-State: AOAM532nKqDLtDomSeSxe6kJMlwclyEOSFD/K2MzNwAZzgg+coG69O2P
        Us0NWcrQbpJykjou1f9REMjvbETeOXPUxKgOHw==
X-Google-Smtp-Source: ABdhPJwLT092bs3AFfkMfntef180wXJ2jqUTP5H8tHar6p2XpCjD2BvDYJfMBtKmNzoqkYj5wqdW///Ls2aIzDtQEpw=
X-Received: by 2002:a2e:bf12:0:b0:249:3a3b:e91a with SMTP id
 c18-20020a2ebf12000000b002493a3be91amr24263398ljr.343.1649777937567; Tue, 12
 Apr 2022 08:38:57 -0700 (PDT)
MIME-Version: 1.0
References: <20220401002200.27584-1-suichen@google.com> <20220401002200.27584-2-suichen@google.com>
 <CAKKbWA4cuv3mPF9Es-TzV-OtbQuLDJdZNU=uOfZXMYaWD-FWCg@mail.gmail.com> <CAJOps0uyo0z7EdBweV4gXUCb6fE-23ayEgce1B3h9KWRQpYwcA@mail.gmail.com>
In-Reply-To: <CAJOps0uyo0z7EdBweV4gXUCb6fE-23ayEgce1B3h9KWRQpYwcA@mail.gmail.com>
From:   Avi Fishman <avifishman70@gmail.com>
Date:   Tue, 12 Apr 2022 18:38:46 +0300
Message-ID: <CAKKbWA5BAiYz48X+HQKDQnP_ho1P7Szb=4oUYRbzTBeUntk2wg@mail.gmail.com>
Subject: Re: [RFC Patch v4 1/1] i2c debug counters as sysfs attributes
To:     Sui Chen <suichen@google.com>
Cc:     Benjamin Fair <benjaminfair@google.com>,
        Joel Stanley <joel@jms.id.au>,
        Tali Perry <tali.perry1@gmail.com>,
        OpenBMC Maillist <openbmc@lists.ozlabs.org>,
        Andrew Jeffery <andrew@aj.id.au>,
        "krellan@google.com" <krellan@google.com>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        Tyrone Ting <warp5tw@gmail.com>,
        Tomer Maimon <tmaimon77@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=0.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,PDS_OTHER_BAD_TLD,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Sui

I am not sure that there is a standard that returning -ENXIO means
always NACK, and I am not sure that there are no other cases where we
return -ENXIO which is not NACK, unless you are asking for local
modification that will not be upstreamed.

Also you can know the per-address counters via the 'adap' stract you
use for transfer.

Thanks,
Avi

On Tue, Apr 12, 2022 at 9:57 AM Sui Chen <suichen@google.com> wrote:
>
> Hello Avi,
>
> I recently installed a patched kernel on a real machine and am trying
> to validate the counters a bit; I would like to find out how the
> counters in the i2c core relate to the counters in the npcm7xx driver,
> and also explore the possibility of per-address counters, then update
> to this list and the linux-kernel list when the results are clear.
>
> And also I need to find a better place to create the sysfs folders
> than from within i2c_transfer and i2c_recover_bus.
>
> Thanks,
> Sui
>
>
> On Sun, Apr 3, 2022 at 5:12 AM Avi Fishman <avifishman70@gmail.com> wrote:
> >
> > Hi Sui,
> >
> > Do you intend later to push it also to kernel.org?
> >
> > Avi
> >
> > On Fri, Apr 1, 2022 at 3:28 AM Sui Chen <suichen@google.com> wrote:
> > >
> > > This change renames the I2C debug counters as suggested, and moves their
> > > processing into the i2c core:
> > > - bus_errors
> > > - transfers
> > > - nacks
> > > - recovery_successes
> > > - recovery_failures
> > > - timeouts
> > >
> > > The function i2c_adapter_create_stats_folder creates a stats directory
> > > in the device's sysfs directory to hold the above debug counters.
> > >
> > > Did some brief tests with a few test programs that saves/replays I2C
> > > trace by reading hwmon sensors. The test program and hardware run in
> > > QEMU. The test programs are located at
> > > https://gerrit.openbmc-project.xyz/c/openbmc/openbmc-tools/+/52527
> > >
> > > (A normal read)
> > >
> > > root@gsj:/tmp# cat /sys/class/i2c-adapter/i2c-1/stats/transfers
> > > 264
> > > root@gsj:/tmp# ./i2c_bmk_bmc  0
> > > idx=0
> > > Processing 1 inputs
> > > /sys/class/hwmon/hwmon0/temp1_input
> > > (../../devices/platform/ahb/ahb:apb/f0081000.i2c/i2c-1/1-005c/hwmon/hwmon0):
> > > 0
> > > [FindTraceEntries] t0=391.000000 t1=393.000000
> > > Found 4 interesting I2C trace entries:
> > >  i2c_write: i2c-1 #0 a=05c f=0000 l=1 [00]
> > >  i2c_read: i2c-1 #1 a=05c f=0001 l=2
> > >  i2c_reply: i2c-1 #1 a=05c f=0001 l=2 [00-00]
> > >  i2c_result: i2c-1 n=2 ret=2
> > > root@gsj:/tmp# cat /sys/class/i2c-adapter/i2c-1/stats/transfers
> > > 265
> > >
> > > (Read from an inexistent address, NACK)
> > >
> > > root@gsj:/tmp# cat /sys/class/i2c-adapter/i2c-1/stats/nacks
> > > 6
> > > root@gsj:/tmp# cat /sys/class/i2c-adapter/i2c-1/stats/transfers
> > > 265
> > >
> > > root@gsj:/tmp# cat i2c_trace.txt
> > >  i2c_write: i2c-1 #0 a=0ff f=0000 l=1 [00]
> > >  i2c_read: i2c-1 #1 a=0ff f=0001 l=2
> > > root@gsj:/tmp# ./i2c_replay_bmc i2c_trace.txt
> > > (program runs and completes)
> > >
> > > root@gsj:/tmp# cat /sys/class/i2c-adapter/i2c-1/stats/nacks
> > > 12
> > > root@gsj:/tmp# cat /sys/class/i2c-adapter/i2c-1/stats/transfers
> > > 265
> > >
> > > The program makes 2 attempts, performing 3 I2C operations at each
> > > attempt, which translates to the 6 nack events.
> > >
> > > Signed-off-by: Sui Chen <suichen@google.com>
> > > ---
> > >  drivers/i2c/i2c-core-base.c | 32 ++++++++++++-
> > >  drivers/i2c/i2c-dev.c       | 94 +++++++++++++++++++++++++++++++++++++
> > >  include/linux/i2c.h         | 26 ++++++++++
> > >  3 files changed, 151 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
> > > index 84f12bf90644..53688b1d855a 100644
> > > --- a/drivers/i2c/i2c-core-base.c
> > > +++ b/drivers/i2c/i2c-core-base.c
> > > @@ -270,11 +270,22 @@ EXPORT_SYMBOL_GPL(i2c_generic_scl_recovery);
> > >
> > >  int i2c_recover_bus(struct i2c_adapter *adap)
> > >  {
> > > +
> > > +       if (adap->stats == NULL)
> > > +               i2c_adapter_create_stats_directory(adap);
> > > +
> > >         if (!adap->bus_recovery_info)
> > >                 return -EBUSY;
> > >
> > >         dev_dbg(&adap->dev, "Trying i2c bus recovery\n");
> > > -       return adap->bus_recovery_info->recover_bus(adap);
> > > +       int ret = adap->bus_recovery_info->recover_bus(adap);
> > > +
> > > +       if (ret == 0)
> > > +               ++(adap->stats->recovery_successes);
> > > +       else
> > > +               ++(adap->stats->recovery_failures);
> > > +
> > > +       return ret;
> > >  }
> > >  EXPORT_SYMBOL_GPL(i2c_recover_bus);
> > >
> > > @@ -2223,6 +2234,23 @@ int __i2c_transfer(struct i2c_adapter *adap, struct i2c_msg *msgs, int num)
> > >                 trace_i2c_result(adap, num, ret);
> > >         }
> > >
> > > +       if (adap->stats == NULL) {
> > > +               i2c_adapter_create_stats_directory(adap);
> > > +       }
> > > +
> > > +       if (ret < 0) {
> > > +               if (ret == -ENXIO)
> > > +                       ++(adap->stats->nacks);
> > > +               else if (ret == -ETIMEDOUT)
> > > +                       ++(adap->stats->timeouts);
> > > +               else
> > > +                       ++(adap->stats->bus_errors);
> > > +       }
> > > +
> > > +       if (ret == num) {
> > > +               ++(adap->stats->transfers);
> > > +       }
> > > +
> > >         return ret;
> > >  }
> > >  EXPORT_SYMBOL(__i2c_transfer);
> > > @@ -2485,6 +2513,7 @@ static int i2c_detect(struct i2c_adapter *adapter, struct i2c_driver *driver)
> > >         }
> > >
> > >         kfree(temp_client);
> > > +       i2c_adapter_create_stats_directory(adapter);
> > >         return err;
> > >  }
> > >
> > > @@ -2617,6 +2646,7 @@ void i2c_put_dma_safe_msg_buf(u8 *buf, struct i2c_msg *msg, bool xferred)
> > >
> > >         kfree(buf);
> > >  }
> > > +
> > >  EXPORT_SYMBOL_GPL(i2c_put_dma_safe_msg_buf);
> > >
> > >  MODULE_AUTHOR("Simon G. Vogl <simon@tk.uni-linz.ac.at>");
> > > diff --git a/drivers/i2c/i2c-dev.c b/drivers/i2c/i2c-dev.c
> > > index 77f576e51652..253622706b63 100644
> > > --- a/drivers/i2c/i2c-dev.c
> > > +++ b/drivers/i2c/i2c-dev.c
> > > @@ -767,6 +767,100 @@ static void __exit i2c_dev_exit(void)
> > >         unregister_chrdev_region(MKDEV(I2C_MAJOR, 0), I2C_MINORS);
> > >  }
> > >
> > > +static struct i2c_adapter *kobj_to_adapter(struct device *pdev)
> > > +{
> > > +       struct kobject *dev_kobj;
> > > +       struct device *dev;
> > > +
> > > +       dev_kobj = ((struct kobject *)pdev)->parent;
> > > +       dev = container_of(dev_kobj, struct device, kobj);
> > > +       return to_i2c_adapter(dev);
> > > +}
> > > +
> > > +ssize_t bus_errors_show(struct device *pdev,
> > > +                       struct device_attribute *attr, char *buf)
> > > +{
> > > +       return sysfs_emit(buf, "%llu\n", kobj_to_adapter(pdev)->stats->bus_errors);
> > > +}
> > > +DEVICE_ATTR_RO(bus_errors);
> > > +
> > > +ssize_t transfers_show(struct device *pdev,
> > > +                            struct device_attribute *attr, char *buf)
> > > +{
> > > +       return sysfs_emit(buf, "%llu\n", kobj_to_adapter(pdev)->stats->transfers);
> > > +}
> > > +DEVICE_ATTR_RO(transfers);
> > > +
> > > +ssize_t nacks_show(struct device *pdev,
> > > +                  struct device_attribute *attr, char *buf)
> > > +{
> > > +       return sysfs_emit(buf, "%llu\n", kobj_to_adapter(pdev)->stats->nacks);
> > > +}
> > > +DEVICE_ATTR_RO(nacks);
> > > +
> > > +ssize_t recovery_successes_show(struct device *pdev,
> > > +                               struct device_attribute *attr, char *buf)
> > > +{
> > > +       return sysfs_emit(buf, "%llu\n", kobj_to_adapter(pdev)->stats->recovery_successes);
> > > +}
> > > +DEVICE_ATTR_RO(recovery_successes);
> > > +
> > > +ssize_t recovery_failures_show(struct device *pdev,
> > > +                              struct device_attribute *attr, char *buf)
> > > +{
> > > +       return sysfs_emit(buf, "%llu\n", kobj_to_adapter(pdev)->stats->recovery_failures);
> > > +}
> > > +DEVICE_ATTR_RO(recovery_failures);
> > > +
> > > +ssize_t timeouts_show(struct device *pdev,
> > > +                     struct device_attribute *attr, char *buf)
> > > +{
> > > +       return sysfs_emit(buf, "%llu\n", kobj_to_adapter(pdev)->stats->timeouts);
> > > +}
> > > +DEVICE_ATTR_RO(timeouts);
> > > +
> > > +/**
> > > + * i2c_adapter_create_stats_directory - creates folder for I2C statistics.
> > > + * @adapter: the i2c_adapter to create the stats directory for.
> > > + *
> > > + * Return: 0 if successful, 1 if failed.
> > > + */
> > > +int i2c_adapter_create_stats_directory(struct i2c_adapter *adapter)
> > > +{
> > > +       struct i2c_adapter_stats *stats;
> > > +       int ret = 1;
> > > +
> > > +       stats = kzalloc(sizeof(*stats), GFP_KERNEL);
> > > +       if (!stats) {
> > > +               adapter->stats = NULL;
> > > +               return ret;
> > > +       }
> > > +       adapter->stats = stats;
> > > +       adapter->stats->kobj = kobject_create_and_add("stats", &adapter->dev.kobj);
> > > +
> > > +       ret = sysfs_create_file(adapter->stats->kobj, &dev_attr_transfers.attr);
> > > +       if (ret)
> > > +               dev_warn(&adapter->dev, "Failed to create sysfs file for tx_complete_cnt\n");
> > > +
> > > +       ret = sysfs_create_file(adapter->stats->kobj, &dev_attr_bus_errors.attr);
> > > +       if (ret)
> > > +               dev_warn(&adapter->dev, "Failed to create sysfs file for bus_errors\n");
> > > +
> > > +       ret = sysfs_create_file(adapter->stats->kobj, &dev_attr_nacks.attr);
> > > +       if (ret)
> > > +               dev_warn(&adapter->dev, "Failed to create sysfs file for nacks\n");
> > > +
> > > +       ret = sysfs_create_file(adapter->stats->kobj, &dev_attr_recovery_successes.attr);
> > > +       if (ret)
> > > +               dev_warn(&adapter->dev, "Failed to create sysfs file for recovery_successes\n");
> > > +
> > > +       ret = sysfs_create_file(adapter->stats->kobj, &dev_attr_recovery_failures.attr);
> > > +       if (ret)
> > > +               dev_warn(&adapter->dev, "Failed to create sysfs file for recovery_failures\n");
> > > +
> > > +       return ret;
> > > +}
> > > +
> > >  MODULE_AUTHOR("Frodo Looijaard <frodol@dds.nl>");
> > >  MODULE_AUTHOR("Simon G. Vogl <simon@tk.uni-linz.ac.at>");
> > >  MODULE_DESCRIPTION("I2C /dev entries driver");
> > > diff --git a/include/linux/i2c.h b/include/linux/i2c.h
> > > index 3eb60a2e9e61..c8608378da2a 100644
> > > --- a/include/linux/i2c.h
> > > +++ b/include/linux/i2c.h
> > > @@ -21,6 +21,7 @@
> > >  #include <linux/of.h>          /* for struct device_node */
> > >  #include <linux/swab.h>                /* for swab16 */
> > >  #include <uapi/linux/i2c.h>
> > > +#include <linux/slab.h> /* for kzalloc */
> > >
> > >  extern struct bus_type i2c_bus_type;
> > >  extern struct device_type i2c_adapter_type;
> > > @@ -684,6 +685,25 @@ struct i2c_adapter_quirks {
> > >         u16 max_comb_2nd_msg_len;
> > >  };
> > >
> > > +/**
> > > + * I2C statistics
> > > + * The list of statistics are currently copied from npcm7xx.
> > > + * Perhaps a more universal set of statistics can be used.
> > > + *
> > > + * The stats are currently modeled as pointers to members in the bus drivers.
> > > + * A null pointer indicates the counter is not supported by the bus driver.
> > > + */
> > > +struct i2c_adapter_stats {
> > > +       struct kobject *kobj;
> > > +
> > > +       u64 transfers;
> > > +       u64 bus_errors;
> > > +       u64 nacks;
> > > +       u64 recovery_successes;
> > > +       u64 recovery_failures;
> > > +       u64 timeouts;
> > > +};
> > > +
> > >  /* enforce max_num_msgs = 2 and use max_comb_*_len for length checks */
> > >  #define I2C_AQ_COMB                    BIT(0)
> > >  /* first combined message must be write */
> > > @@ -735,12 +755,18 @@ struct i2c_adapter {
> > >
> > >         struct i2c_bus_recovery_info *bus_recovery_info;
> > >         const struct i2c_adapter_quirks *quirks;
> > > +       struct i2c_adapter_stats *stats;
> > >
> > >         struct irq_domain *host_notify_domain;
> > >         struct regulator *bus_regulator;
> > >  };
> > >  #define to_i2c_adapter(d) container_of(d, struct i2c_adapter, dev)
> > >
> > > +int i2c_adapter_create_stats_directory(struct i2c_adapter *adapter);
> > > +
> > > +void i2c_adapter_stats_register_counter(struct i2c_adapter *adapter,
> > > +                                       const char *counter_name, void *data_source);
> > > +
> > >  static inline void *i2c_get_adapdata(const struct i2c_adapter *adap)
> > >  {
> > >         return dev_get_drvdata(&adap->dev);
> > > --
> > > 2.35.1.1094.g7c7d902a7c-goog
> > >
> >
> >
> > --
> > Regards,
> > Avi



-- 
Regards,
Avi
